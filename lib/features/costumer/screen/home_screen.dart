
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nearby/features/costumer/services/customer_services.dart';
import 'package:nearby/models/deals_model.dart';
import 'package:provider/provider.dart';

import '../../../common/stars.dart';
import '../../../constant/global_variable.dart';

import '../../../provider/user_provider.dart';
import 'deatil_screen.dart';
import 'friendlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController search = TextEditingController();

  List<Deals>? deals = [];


  CustomerServices customerservcices = CustomerServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchalldeal();
  }

  void fetchalldeal()async{
    deals = await customerservcices.fetchAllDeals(context);
    setState(() {});
  }

  void navigateToDetailscreen() {
    Navigator.pushNamed(context, DetailScreen.routeName, );
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text("${user.name}"),
      ),


      body: deals ==null?const CircularProgressIndicator():Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SizedBox(height: 14,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 35),
            child: const Text('Deal of the day', style: TextStyle(fontSize: 20),),
          ),
          Container(
            height: 144,
              margin:  EdgeInsets.only(left: 16,right: 16),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.only(left: 16)
                          ,height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border:Border.all(color: Colors.grey, width: 1)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.airplane_ticket_outlined,
                            ),
                            Padding(padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Flignt', style: TextStyle(fontSize: 17,fontWeight:
                                FontWeight.w700),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text('Feel Freedom', style: TextStyle(fontSize: 14),),
                                )
                              ],
                            ),)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.only(left: 16)
                        ,height: 64,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border:Border.all(color: Colors.grey, width: 1)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.airplane_ticket_outlined,
                            ),
                            Padding(padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Flignt', style: TextStyle(fontSize: 17,fontWeight:
                                  FontWeight.w700),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('Feel Freedom', style: TextStyle(fontSize: 14),),
                                  )
                                ],
                              ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.only(left: 16)
                        ,height: 64,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border:Border.all(color: Colors.grey, width: 1)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.airplane_ticket_outlined,
                            ),
                            Padding(padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Flignt', style: TextStyle(fontSize: 17,fontWeight:
                                  FontWeight.w700),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('Feel Freedom', style: TextStyle(fontSize: 14),),
                                  )
                                ],
                              ),)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.only(left: 16)
                        ,height: 64,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border:Border.all(color: Colors.grey, width: 1)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.airplane_ticket_outlined,
                            ),
                            Padding(padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Flignt', style: TextStyle(fontSize: 17,fontWeight:
                                  FontWeight.w700),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('Feel Freedom', style: TextStyle(fontSize: 14),),
                                  )
                                ],
                              ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                )


              ],
            ),
          ),
          SizedBox(height: 20,),
          new Expanded(
            child: ListView.builder(
              itemCount: deals!.length,
              itemBuilder: (context, index) {
                final deal = deals![index];
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, DetailScreen.routeName,arguments: deal );
                  },
                  child: SizedBox(
                    width: double.infinity,  // set the width of the container to the full width of the screen
                    child: Card(

                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.red,
                                borderRadius: BorderRadius.circular(8)
                              ),

                              child: Image.network(
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
                            padding: const EdgeInsets.all(8.0),
                            child: Text('\$${deal.price.toString()}', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

