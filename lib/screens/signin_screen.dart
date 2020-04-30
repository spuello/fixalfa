import 'package:app/components/auth_choice_divider.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/primary_flat_button.dart';
import 'package:app/components/social_media_auth_button.dart';
import 'package:app/constants.dart';
import 'package:app/screens/cockpit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _email;
  String _password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _signInWithUserAndPassword() async {
    if (_email == null) {
      _email = "admin@email.com";
    }
    if (_password == null) {
      _password = "123456";
    }

    try {
      final AuthResult signedUser = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (signedUser != null) {
        Navigator.pushNamed(context, CockpitScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    SizedBox verticalSideBox = SizedBox(
      height: 20.0,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "FIXALFA",
                      style: kLogoTypeStyle(color: kFixalfaGreen500),
                    ),
                  ),
                ),
                CustomTextField(
                  onChanged: (value) {
                    _email = value;
                  },
                  hintText: "Correo electrónico",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSideBox,
                CustomTextField(
                  onChanged: (value) {
                    _password = value;
                  },
                  hintText: "Contraseña",
                  obscureText: true,
                ),
                verticalSideBox,
                PrimaryFlatButton(
                  color: kPrimaryColor,
                  title: "Iniciar sesión",
                  textColor: Colors.white,
                  onPressed: () {
                    _signInWithUserAndPassword();
                  },
                  borderSideColor: Colors.transparent,
                ),
                verticalSideBox,
                AuthChoiceDivider(),
                verticalSideBox,
                SocialMediaAuthButton(
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                  buttonTitle: "Iniciar con Facebook",
                  buttonBackgroundColor: (kFacebookBlueColor),
                  buttonImage: "images/icons/facebook-logo.png",
                  onTap: () {
                    print("Facebook LOGIN");
                  },
                ),
                verticalSideBox,
                SocialMediaAuthButton(
                  buttonImage: "images/icons/google-logo.png",
                  buttonBackgroundColor: kGoogleRedColor,
                  borderColor: (Colors.transparent),
                  textColor: Colors.white,
                  buttonTitle: "Iniciar con Google",
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
