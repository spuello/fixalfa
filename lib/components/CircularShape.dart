import 'package:flutter/material.dart';

class CircularShape extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Color color;

  CircularShape(
      {this.height: 5.0, this.width: 5.0, this.borderRadius: 50.0, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
    );
  }
}
