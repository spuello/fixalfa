import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class SmallCircularShape extends StatelessWidget {
  SmallCircularShape(
      {this.height: 5.0, this.width: 5.0, this.borderRadius: 50.0});
  final width;
  final height;
  final borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
    );
  }
}
