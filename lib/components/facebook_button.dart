import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';

class FacebookButton extends StatelessWidget {
  final Function onPressed;

  FacebookButton({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.facebook,
            color: kFixalfaBackgroundWhite,
            size: 30.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text("Iniciar Facebook",
              style: TextStyle(fontSize: 20.0, color: kFixalfaBackgroundWhite))
        ],
      ),
      padding: EdgeInsets.all(15.0),
      onPressed: onPressed,
      color: kFacebookBlueColor,
    );
  }
}
