import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nearby/common/bottombar.dart';
import 'package:nearby/constant/error_handiling.dart';
import 'package:nearby/constant/global_variable.dart';
import 'package:nearby/constant/utils.dart';
import 'package:nearby/features/merchant/screen/Merchant_screen.dart';
import 'package:nearby/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:nearby/splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/user_provider.dart';
import '../screen/login_screen.dart';

class AuthServices{

  //signup user
  void signupUser({
    required BuildContext context,
  required String name,
    required String password,
    required phoneno,
    required type,
})async {
    try{
      User user = User(id: '', name: name,
          password: password, phone: phoneno, token: '',type: type,
      cart: []);
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
      body:user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

      httpErrorHandle(response: res, context: context,
          onSuccess: (){
        showSnackBar(context,  'Account created! Login with the same credentials');
        Navigator.pushNamed(context, AuthScreen.routeName);
          });
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
  //sig in user
  void signInUser({
    required BuildContext context,
    required String password,
    required String phone,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'phone':phone,
            'password':password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          jsonDecode(res.body)['type'] =='customer'?    Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
                (route) => false,
          ):    Navigator.pushNamedAndRemoveUntil(
            context,
            Merchant_screen.routeName,
                (route) => false,
          );

        },
      );

    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  //get user data
  void getUserData(
      BuildContext context,

      ) async {

    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if(token ==null){
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token':token!}
      );
      var response = jsonDecode(tokenRes.body);
      if(response ==true) {
        http.Response usrRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token':token});
        var userProvider = Provider.of<UserProvider>(context,listen: false);
        userProvider.setUser(usrRes.body);
      }

    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
}