

import 'package:flutter/material.dart';
import 'package:nearby/common/custom_button.dart';
import 'package:nearby/features/costumer/services/customer_services.dart';

import '../../../constant/global_variable.dart';
import '../../../models/deals_model.dart';

class Buying_page extends StatefulWidget {
  static const String routeName= '/buy-page';
  final Deals deal;
  const Buying_page({Key? key, required this.deal}) : super(key: key);

  @override
  State<Buying_page> createState() => _Buying_pageState();
}

class _Buying_pageState extends State<Buying_page> {
  CustomerServices customerservices = CustomerServices();

  void navigatetobuy(){
    customerservices.addToCart(context: context, deals: widget.deal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),

      ),

      body:Column(
      children:<Widget> [
        SizedBox(height: 120,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total price'),
              Text("Rs.${widget.deal.price}")
            ],
          ),
        ),
        SizedBox(height: 100,

        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: CustomButton(
            text: 'Get a coupon',
            color: Colors.pink,
            onTap: navigatetobuy,
          ),
        ),


      ],
      ),
    );
  }
}
