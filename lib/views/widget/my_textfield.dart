import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final lable ;
  final message;
  final controller;
  final bool obscureText;
  final bool isSignup;

  MyTextfield({required this.lable,required this.message,required this.controller,required this.obscureText, required this.isSignup});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      child: SizedBox(
        width: 370,
        height: 60,
        child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              labelText: lable,
              labelStyle: TextStyle(color:Color(0xFF17212C) ),
              border: _border,
              focusedBorder: _border,
              enabledBorder: _border),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return message;
            } if (obscureText && value.length < 6 && isSignup) {
              return 'Password must be at least 6 characters'; // Password length validation
            }
            else {
              return null;
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),

    );
  }
}

var _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(color: Color(0xFF17212C), width: 2) // Rounded corners
);

