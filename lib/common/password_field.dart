
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {


  final TextEditingController controller;
  final String labeltext;


  const PasswordField({required this.controller,

    required this.labeltext ,Key? key }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon:  IconButton(
            icon:Icon(_obscureText ? Icons.visibility_off:Icons.visibility,size: 18,),
            onPressed: _togglePasswordStatus,
            color:  Color(0xffFF0000)
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text('${widget.labeltext}',style: TextStyle(fontSize: 14),),
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),

      ),
      obscureText: _obscureText,
      validator: (val){
        if(val ==null||val.isEmpty){

          return 'Enter your ${widget.labeltext}';

      } else if(val.length <= 7) {
      return 'Password must greater than 7 digit';
    }


        return null;
      },
    );
  }
}
