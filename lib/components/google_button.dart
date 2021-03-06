import 'package:app/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButton extends StatelessWidget {
  final Function onPressed;
  GoogleButton({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.google,
            color: kFixalfaBackgroundWhite,
            size: 30.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text("Iniciar con Google",
              style: TextStyle(fontSize: 20.0, color: kFixalfaBackgroundWhite))
        ],
      ),
      padding: EdgeInsets.all(15.0),
      onPressed: onPressed,
      color: kGoogleRedColor,
    );
  }
}
