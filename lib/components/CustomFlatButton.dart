import 'package:flutter/material.dart';

class PrimaryFlatButton extends StatelessWidget {
  PrimaryFlatButton(
      {this.title,
      this.textColor: Colors.white,
      this.color: Colors.transparent,
      this.borderSideColor: Colors.transparent,
      this.onPressed});

  final String title;
  final Color textColor;
  final Color color;
  final Color borderSideColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20.0, color: textColor, fontWeight: FontWeight.w300),
      ),
      padding: EdgeInsets.symmetric(vertical: 15.0),
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: borderSideColor)),
    );
  }
}
