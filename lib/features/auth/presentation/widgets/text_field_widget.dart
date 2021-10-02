import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  Icon prefixIcon;
  Icon? suffixIcon;

  TextFieldWidget({
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
