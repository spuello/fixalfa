import 'package:app/components/auth_choice_divider.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/primary_flat_button.dart';
import 'package:app/components/social_media_auth_button.dart';
import 'package:app/constants.dart';
import 'package:app/screens/cockpit.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "signup_screen";
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
        Navigator.pushNamed(context, CockpitScreen.id);
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
                      top: 50.0, right: 30.0, bottom: 20.0, left: 30.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/app_launch.png"),
                        radius: 70.0,
                      ),
                      CustomTextField(
                        onChanged: (value) {
                          _email = value;
                        },
                        obscureText: false,
                        hintText: "Correo electrónico",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      getVerticalSideBox(),
                      CustomTextField(
                        onChanged: (value) {
                          _password = value;
                        },
                        obscureText: true,
                        hintText: "Contraseña",
                      ),
                      getVerticalSideBox(),
                      PrimaryFlatButton(
                        title: "Registrar",
                        color: kPrimaryColor,
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
                                  Navigator.pushNamed(context, SignInScreen.id);
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