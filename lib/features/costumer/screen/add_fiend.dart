import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nearby/features/costumer/services/customer_services.dart';
import 'package:nearby/models/deals_model.dart';

import '../../../constant/global_variable.dart';

class Add_new_friend extends StatefulWidget {
  static const String routeName = '/add-new-friend';
  // final Customer customer;

  const Add_new_friend({Key? key, }) : super(key: key);

  @override
  State<Add_new_friend> createState() => _Add_new_friendState();
}

class _Add_new_friendState extends State<Add_new_friend> {
  final TextEditingController phone = TextEditingController();

  List<Deals>? friends = [];
  List<User>? user = [];


  CustomerServices customerservcices = CustomerServices();



  @override
  void initState() {
    super.initState();
    fetchAllFriend();
  }
  void fetchAllFriend()async{
    friends = await customerservcices.fetchAllDeals(context);

  }
  //
  // void fetchAllFrsiend()async{
  //   user = await customerservcices.fetchfriend(context: context, phone: phone.text);
  //
  // }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                'Add  New Friends',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children:<Widget> [
          Form(
            child:Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: phone,
                onChanged: (value){},
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "Enter friend Phone no",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Icon(Icons.search, color: Colors.grey,),
                  ),
                    border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
                ),

              ),
            ) ,
          ),


          const Divider(height:4,thickness: 5,color: const Color(0xffE5E8E8 ),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(width: double.infinity,
              child: ElevatedButton.icon(onPressed: (){},
                icon: Icon(Icons.search, color: Colors.black,),
                  label: const Text('Seacrch the friend', style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black38,
                elevation: 0,
                fixedSize: const Size(double.infinity, 40),
              ),),
            ),
          ),
          const Divider(height:4,thickness: 5,color: const Color(0xffE5E8E8 ),),



          new Expanded(
            child: ListView.builder(

                shrinkWrap: true,
                itemCount:1,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: Text('Add'),
                        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      ),
                      leading: CircleAvatar(radius: 24,
                        backgroundColor: const Color(0xff764ac),
                        child: Text("c",style: TextStyle(fontWeight: FontWeight.bold,
                            color: GlobalVariables.secondaryColor),),
                      ),
                      title: Text("Abishek Tiwari",style: TextStyle(fontSize: 20),),
                      subtitle: Text('9845408829'),

                    ),
                  );
                }),
          ),

          const SizedBox(height: 20,),






        ],
      ),



    );

  }
}