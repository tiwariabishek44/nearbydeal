
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearby/features/merchant/sercices/merchantservices.dart';
import 'package:nearby/models/deals_model.dart';
import 'package:provider/provider.dart';

import '../../../common/stars.dart';
import '../../../provider/user_provider.dart';
import 'add_deal_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  // List<Product>? products;
  List<Deals>? products = [];
  final MerchintServices merchantservices = MerchintServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }
  void deleteProduct(Deals product, int index) {
    merchantservices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  fetchAllProducts() async {
    products= await merchantservices.fetchAllDeals(context);
    setState(() {});
  }

  void navigateToAddDeal() {
    Navigator.pushNamed(context, AddDealScrean.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return
      RefreshIndicator(
        onRefresh: () async{
          products = await merchantservices.fetchAllDeals(context);
        },
        child: products == null
          ? const Center(
          child: CircularProgressIndicator(),
        )
          :
        Scaffold(

        body: ListView.builder(
          itemCount: products!.length,
          itemBuilder: (context, index) {
            final deal = products![index];
            return GestureDetector(
              // onTap: navigateToDetailscreen,
              child: SizedBox(
                width: double.infinity,  // set the width of the container to the full width of the screen
                child: Card(
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child:

                          deal.images[0] == null
                              ? const Center(
                            child: CircularProgressIndicator(),
                          ):Image.network(
                              deal.images[0],
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width
                          ),
                        ),
                      ),
                      Stars(
                        rating: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(deal.name, style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$${deal.price.toString()}', style: TextStyle(fontSize: 16)),

                                 Row(
                                  children: [
                                    GestureDetector(
                                        onTap: ()=>deleteProduct(deal, index),
                                        child: Icon(Icons.delete_outline, color: Colors.red,size: 20,)),
                                    SizedBox(width: 10,),
                                  ],
                                )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            );
          },
        ),



        floatingActionButton:FloatingActionButton.extended(
          onPressed: navigateToAddDeal,
          label: Text('New Deal'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.endFloat,
    ),
      );
  }
}

