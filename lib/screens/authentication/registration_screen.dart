import 'package:app/components/auth_choice_divider.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/primary_flat_button.dart';
import 'package:app/components/social_media_auth_button.dart';
import 'package:app/constants.dart';
import 'package:app/screens/authentication/login_screen.dart';
import 'package:app/screens/cockpit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email;
  String _password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _registerWithEmailAndPassword() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      if (newUser != null) {
        Navigator.pushNamed(context, CockpitScreen.routeName);
      }
    } catch (e) {
      print(e);
    }
  }

  //TODO:Add icon to show the password field
  //TODO:Add full name field
  //TODO: Add authentication with facebook and google

  SizedBox getVerticalSideBox({double height: 15.0}) => SizedBox(
        height: height,
      );

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 50.0, right: 25.0, bottom: 20.0, left: 25.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 50.0, top: 20.0),
                        child: Text(
                          "FIXALFA",
                          style: kLogoTypeStyle(color: kFixalfaGreen500),
                        ),
                      ),
                      FixAlfaFormField(
                        onChanged: (value) {
                          _email = value;
                        },
                        obscureText: false,
                        hintText: "Correo electrónico",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      getVerticalSideBox(),
                      FixAlfaFormField(
                        onChanged: (value) {
                          _password = value;
                        },
                        obscureText: true,
                        hintText: "Contraseña",
                      ),
                      getVerticalSideBox(),
                      PrimaryFlatButton(
                        title: "Registrar",
                        color: kFixalfaGreen500,
                        textColor: Colors.white,
                        onPressed: () {
                          _registerWithEmailAndPassword();
                        },
                      ),
                      getVerticalSideBox(
                        height: 30.0,
                      ),
                      AuthChoiceDivider(),
                      getVerticalSideBox(),
                      SocialMediaAuthButton(
                          onTap: () {
                            print("Social Media Auth Button");
                          },
                          buttonImage: ("images/icons/facebook-logo.png"),
                          buttonTitle: "Registrarse con Facebook",
                          buttonBackgroundColor: kFacebookBlueColor,
                          textColor: Colors.white,
                          borderColor: Colors.transparent),
                      getVerticalSideBox(),
                      SocialMediaAuthButton(
                        buttonImage: "images/icons/google-logo.png",
                        buttonBackgroundColor: kGoogleRedColor,
                        borderColor: (Colors.transparent),
                        textColor: Colors.white,
                        buttonTitle: "Registrarse con Google",
                        onTap: () {},
                      ),
                      getVerticalSideBox(height: 30.0),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(text: "Al registrarse, acepta los "),
                          TextSpan(
                              text: "Términos de servicio",
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(text: " y la "),
                          TextSpan(
                              text: "Política de privacidad",
                              style: TextStyle(color: Colors.blue))
                        ]),
                        style: TextStyle(fontSize: 16.0, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      getVerticalSideBox(height: 30.0),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "¿Ya tienes una cuenta?"),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                    context,
                                    LoginScreen.routeName,
                                  );
                                },
                              text: " Inciar sesión",
                              style: TextStyle(color: Colors.blue))
                        ], style: TextStyle(fontSize: 16.0)),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
