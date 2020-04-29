import 'package:flutter/material.dart';

class SocialMediaAuthButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  final String buttonImage;
  final Color buttonBackgroundColor;
  final Color textColor;
  final Color borderColor;

  SocialMediaAuthButton(
      {this.buttonTitle,
      this.onTap,
      this.buttonImage,
      this.buttonBackgroundColor,
      this.textColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 54.0,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                image: DecorationImage(
                    image: AssetImage(buttonImage), fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 54.0,
              child: Center(
                child: Text(
                  buttonTitle,
                  style: TextStyle(fontSize: 20.0, color: textColor),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0)),
                color: buttonBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
