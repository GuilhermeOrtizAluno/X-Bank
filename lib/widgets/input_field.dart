import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Stream<String> stream;
  final Function(String) onChanged;  

  InputField({this.icon, this.hint, this.obscure, this.controller, this.keyboardType, this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: onChanged,
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(color: Colors.black),
            obscureText: obscure,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: hint,
              errorText: snapshot.hasError ? snapshot.error : null,
              prefixIcon: Icon(icon, color: Colors.black),
              contentPadding: EdgeInsets.only(
                left: 0,
                right: 50,
                bottom: 20,
                top: 20
              ),
              hintStyle: TextStyle(color: Colors.grey[400]),
              fillColor: Colors.grey[200],
              filled: true,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                  width: 3
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                  width: 3
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                  width: 3
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 3
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              focusedErrorBorder:  UnderlineInputBorder(
               borderSide: BorderSide(
                 color: Colors.red,
                 width: 3
                ),
               borderRadius: BorderRadius.circular(12)
              )
            ),
          );
        }
      )
    );
  }
}


