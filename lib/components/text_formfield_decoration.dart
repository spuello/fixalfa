import 'package:app/colors.dart';
import 'package:flutter/material.dart';

class TexTFormFieldInputDecoration {
  static InputDecoration getDecoration({String hintText, IconData iconData}) {
    return InputDecoration(
      prefixIcon: Icon(iconData),
      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: kFixalfaGreen50,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
  }
}
