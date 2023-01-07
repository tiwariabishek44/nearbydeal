
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String labeltext;
  final int? maxline;



  const CustomTextfield({required this.controller,
    required this.labeltext ,this.maxline,Key? key }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxline,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        label: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('${widget.labeltext}',style: TextStyle(fontSize: 14,),),
        ),


        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),


      ),
      validator: (val){
        if(val ==null||val.isEmpty){
          return 'Enter your ${widget.labeltext}';
        }
        return null;
      },
    );
  }
}