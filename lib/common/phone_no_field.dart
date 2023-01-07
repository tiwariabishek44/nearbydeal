import 'package:flutter/material.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String labeltext;


  const PhoneField({required this.controller,
    required this.labeltext ,Key? key }) : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon:  IconButton(
            icon:Icon(Icons.phone,size: 16,),
            onPressed: (){},
            color:  Color(0xffFF0000)
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('${widget.labeltext}',style: TextStyle(fontSize: 14,),),
        ),


        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),


      ),
      validator: (val){
        if(val ==null|| val.isEmpty){
          return 'Enter your ${widget.labeltext}';
        }
        return null;
      },
    );
  }
}
