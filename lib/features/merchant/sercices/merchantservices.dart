
import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:nearby/constant/utils.dart';
import 'package:nearby/features/costumer/screen/home_screen.dart';
import 'package:nearby/models/deals_model.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

import '../../../constant/error_handiling.dart';
import '../../../constant/global_variable.dart';
import '../../../provider/user_provider.dart';

class MerchintServices{
  void selldeals({
  required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double limit,
    required double discount,
    required List<File> images,
}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dndtiooiy', 'tp72qoxt');
      List <String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(CloudinaryFile.
        fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }
      print(userProvider.user.token);

      Deals deals = Deals(name: name,
          description: description,
          images: imageUrls,
          discount: discount,
          limit: limit,
          price: price);
      http.Response res = await http.post(
          Uri.parse('$uri/merchant/add-deal'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: deals.toJson()
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


    // get all the products
  Future<List<Deals>> fetchAllDeals(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Deals> dealsList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/merchant/get-deals'), headers: {
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
  void deleteProduct({
    required BuildContext context,
    required Deals product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/merchant/delete-deals'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

}