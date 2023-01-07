

import 'package:flutter/material.dart';
import 'package:nearby/features/auth/auth_services/auth_service.dart';

import '../../../common/custom_button.dart';
import '../../../common/custom_textfield.dart';
import '../../../common/password_field.dart';
import '../../../constant/global_variable.dart';
import 'login_screen.dart';
enum Type {
  customer,
  merchant,
}
class Register extends StatefulWidget {
  static const String routeName = '/register-screen';
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Type _type = Type.customer;
  final _customerkey = GlobalKey<FormState>();
  final _merchantkey = GlobalKey<FormState>();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _namecontrller =TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthServices authservices = AuthServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phone.dispose();
    _namecontrller.dispose();
    _passwordController.dispose();

  }

  void signupCustomer(){
    authservices.signupUser(context: context,
        name: _namecontrller.text, password: _passwordController.text,
        phoneno: _phone.text,type: 'customer');


  }
  void signupMerchant(){
    authservices.signupUser(context: context, name: _namecontrller.text,
        password: _passwordController.text
        , phoneno: _phone.text, type: 'merchant');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(primary:true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        elevation: 0,
      ),
      backgroundColor: GlobalVariables.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Sign Up ', style: TextStyle(fontFamily:'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.bold, ),),
                  ],
                ),
              ),
              ListTile(
                tileColor: _type == Type.customer
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Customer Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Type.customer,
                  groupValue: _type,
                  onChanged: (Type? val) {
                    setState(() {
                      _type = val!;
                    });
                  },
                ),
              ),
              if (_type == Type.customer)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _customerkey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _namecontrller,
                          labeltext: ' Name',
                        ),
                        SizedBox(height: 10,),



                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(width: 50,
                              child:Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: '+977',
                                    labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 3.0),
                                child: TextFormField(
                                  controller: _phone,

                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  validator: (val){
                                    if(val ==null||val.isEmpty){
                                      return 'Enter your Phone no';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 10,),
                        PasswordField(
                          controller: _passwordController,
                          labeltext: 'Password',
                        ),

                        SizedBox(height: 10,),
                        CustomButton(text: 'Sign Up', onTap:(){
                          if(_customerkey.currentState!.validate()){
                            signupCustomer();
                          }
                        },
                            color:  Color(0xffFF0000)

                        ),
                        SizedBox(height: 10,),


                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _type == Type.merchant
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Merchant Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Type.merchant,
                  groupValue: _type,
                  onChanged: (Type? val) {
                    setState(() {
                      _type = val!;
                    });
                  },
                ),
              ),
              if (_type== Type.merchant)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _merchantkey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _namecontrller,
                          labeltext: ' Name',
                        ),
                        SizedBox(height: 10,),


                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(width: 50,
                              child:Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: '+977',
                                    labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 3.0),
                                child: TextFormField(
                                  controller: _phone,

                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  validator: (val){
                                    if(val ==null||val.isEmpty){
                                      return 'Enter your Phone no';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 10,),
                        PasswordField(
                          controller: _passwordController,
                          labeltext: 'Password',
                        ),

                        SizedBox(height: 10,),
                        CustomButton(text: 'Sign Up', onTap:(){
                          if(_merchantkey.currentState!.validate()){
                            signupMerchant();
                          }
                        },
                            color:  Color(0xffFF0000)

                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),
                ),






            ],
          ),
        ),
      ),
    );
  }
}
