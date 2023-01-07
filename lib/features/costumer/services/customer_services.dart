
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/error_handiling.dart';
import '../../../constant/global_variable.dart';
import '../../../constant/utils.dart';
import '../../../models/deals_model.dart';
import '../../../models/order.dart';
import '../../../models/user.dart';
import '../../../provider/user_provider.dart';
import 'package:http/http.dart' as http;

import '../../auth/screen/login_screen.dart';

class CustomerServices{
  Future<List<Deals>> fetchAllDeals(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Deals> dealsList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/customer/get-deals'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });



      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            dealsList.add(
              Deals.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],

                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return dealsList;
  }




  void addToCart({
    required BuildContext context,
    required Deals deals,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/customer/add-order'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': deals.id!

        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
          userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
          Navigator.pop(context);
          showSnackBar(context, 'Sucesfully add deal');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Order>> fetchMyCoupon({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/customer/get-cupons'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
            (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

}