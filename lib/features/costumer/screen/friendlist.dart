import 'package:flutter/material.dart';

import '../../../common/custom_button.dart';
import '../../../common/custom_textfield.dart';
import '../../../common/phone_no_field.dart';
import '../../../constant/global_variable.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_fiend.dart';


class Friendlist extends StatefulWidget {
  const Friendlist({Key? key}) : super(key: key);

  @override
  State<Friendlist> createState() => _FriendlistState();
}

class _FriendlistState extends State<Friendlist> {
  // List<Product>? products;


  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    // products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddFriend() {
    Navigator.pushNamed(context, Add_new_friend.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return
      // products == null
      //   ? const Loader()
      //   :
      Scaffold(

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(title: Text('Friends'),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),

          ),


        ),


        // body: GridView.builder(
        //   itemCount: products!.length,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2),
        //   itemBuilder: (context, index) {
        //     final productData = products![index];
        //     return Column(
        //       children: [
        //         SizedBox(
        //           height: 140,
        //           child: SingleProduct(
        //             image: productData.images[0],
        //           ),
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Expanded(
        //               child: Text(
        //                 productData.name,
        //                 overflow: TextOverflow.ellipsis,
        //                 maxLines: 2,
        //               ),
        //             ),
        //             IconButton(
        //               onPressed: () => deleteProduct(productData, index),
        //               icon: const Icon(
        //                 Icons.delete_outline,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     );
        //   },
        // ),
        floatingActionButton:FloatingActionButton.extended(
          onPressed: navigateToAddFriend,
          label: Text('Add Friend'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.endFloat,
      );
  }
}