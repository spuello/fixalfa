import 'package:flutter/material.dart';

class AuthChoiceDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.50,
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "O",
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            )),
        Expanded(
          child: Divider(
            thickness: .50,
          ),
        )
      ],
    );
  }
}
