import 'package:flutter/material.dart';
import 'package:nearby/features/auth/auth_services/auth_service.dart';
import 'package:nearby/features/auth/screen/login_screen.dart';
import 'package:nearby/features/costumer/screen/home_screen.dart';
import 'package:nearby/provider/user_provider.dart';
import 'package:nearby/route.dart';
import 'package:nearby/splash.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'common/bottombar.dart';
import 'features/merchant/screen/Merchant_screen.dart';

// import 'auth.dart';
// import 'customer_home_page.dart';
// import 'merchant_home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>UserProvider()),

    ],

      child: MyApp()));
}
class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authsaervices = AuthServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authsaervices.getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'NearBy Deal',
      theme: ThemeData(
        primaryColor: Colors.pink
      ),

      onGenerateRoute:(settings)=>generateRoute(settings) ,

      home:

      Provider.of<UserProvider>(context).user.token.isNotEmpty?
    Provider.of<UserProvider>(context).user.type =='customer'?const BottomBar():
        const Merchant_screen():const AuthScreen(),

    );
  }
}

