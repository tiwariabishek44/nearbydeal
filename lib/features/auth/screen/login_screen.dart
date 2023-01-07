
import 'package:flutter/material.dart';
import 'package:nearby/features/auth/auth_services/auth_service.dart';
import 'package:nearby/features/auth/screen/register_screen.dart';

import '../../../common/bottombar.dart';
import '../../../common/custom_button.dart';
import '../../../common/password_field.dart';
import '../../../common/phone_no_field.dart';
import '../../../constant/global_variable.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _signinFormkey = GlobalKey<FormState>();
  final TextEditingController _phoneno = TextEditingController();
  final AuthServices authservices = AuthServices();
  final TextEditingController _passwordControllerr = TextEditingController();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneno.dispose();
    _passwordControllerr.dispose();
  }

  void navigateToRegisater() {
    Navigator.pushNamed(context, Register.routeName);
  }
  void signIn(){
    authservices.signInUser(context: context,
        password: _passwordControllerr.text, phone: _phoneno.text);
  }
  void navigateToForget() {
    // Navigator.pushNamed(context, ForgerPass.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              )
              ,
              Center(
                child: const Text(
                  'Welcome back! ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: const Text(
                  'Login to continue ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                color: GlobalVariables.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _signinFormkey,
                    child: Column(
                      children: [
                        PhoneField(
                          labeltext: 'Phone no.',
                          controller: _phoneno,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PasswordField(
                          controller: _passwordControllerr,
                          labeltext: 'Password',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: navigateToForget,
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: 'Log in',
                            onTap: () {
                              if(_signinFormkey.currentState!.validate()){
                                signIn();
                              }
                            },
                            color: Color(0xffFF0000)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Divider(
                                color: Colors.black54,
                                indent: 20.0,
                                endIndent: 10.0,
                                thickness: 1,
                              ),
                            ),
                            Text(
                              "OR",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.black54,
                                indent: 10.0,
                                endIndent: 20.0,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                                onPressed: navigateToRegisater,
                                child: Text(
                                  'Sign UP',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFF0000)),
                                ))
                          ],
                        )
                      ],
                    ),
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
