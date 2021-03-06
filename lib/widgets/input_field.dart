import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final String error; 

  InputField({this.icon, this.hint, this.obscure, this.controller, this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      //color: Color.fromRGBO(229, 229, 229, 1), 
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.black),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pinkAccent),
          ),
          contentPadding: EdgeInsets.only(
            left: 5,
            right: 10,
            bottom: 10,
            top: 10
          ),
        ),
        style: TextStyle(color: Colors.black),
        obscureText: obscure,
        validator: (text){
          if(text.isEmpty)
            return error;
        },
      )
    );
  }
}


