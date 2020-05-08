import 'package:app/blocs/login/bloc.dart';
import 'package:app/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';

class FacebookLoginButton extends StatelessWidget {
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
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).add(LoginWithFacebookPressed());
      },
      color: kFacebookBlueColor,
    );
  }
}
