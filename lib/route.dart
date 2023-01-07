import 'package:flutter/material.dart';
import 'package:nearby/features/merchant/screen/Merchant_screen.dart';

import 'common/bottombar.dart';

import 'features/auth/screen/login_screen.dart';
import 'features/auth/screen/register_screen.dart';
import 'features/costumer/screen/add_fiend.dart';
import 'features/costumer/screen/buying_page.dart';
import 'features/costumer/screen/deatil_screen.dart';
import 'features/merchant/screen/add_deal_screen.dart';
import 'models/deals_model.dart';





Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
          builder: (_)=>AuthScreen());
    case Register.routeName:
      return MaterialPageRoute(
          builder: (_)=>Register());

    case BottomBar.routeName:
      return MaterialPageRoute(
          builder: (_)=>const BottomBar()
      );
    case Merchant_screen.routeName:
      return MaterialPageRoute(
          builder: (_)=>const Merchant_screen()
      );

    case Add_new_friend.routeName:
      return MaterialPageRoute(
          builder: (_)=>const Add_new_friend()
      );
    case AddDealScrean.routeName:
      return MaterialPageRoute(
          builder: (_)=>const AddDealScrean()
      );

    case Buying_page.routeName:
      var deal = routeSettings.arguments as Deals;
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_)=> Buying_page(
            deal: deal,
          )
      );

    case DetailScreen.routeName:
      var deal = routeSettings.arguments as Deals;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DetailScreen(
          deal: deal,
        ),
      );




    default:
      return MaterialPageRoute(builder: (_)=>Scaffold(
        body: Center(
          child: const Text('page not find'),
        ),
      ));
  }
}