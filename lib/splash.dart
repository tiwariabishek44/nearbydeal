
import 'package:flutter/material.dart';
import 'package:nearby/main.dart';

import 'features/auth/screen/login_screen.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
  _navigatetohome() async {
  await Future.delayed(Duration(milliseconds: 1500),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen()));
  }


  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Center(child: new Image.asset('images/nd.PNG'))
    );
  }
}
