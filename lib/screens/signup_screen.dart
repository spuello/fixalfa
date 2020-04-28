import 'package:app/components/CustomFlatButton.dart';
import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = "signup_screen";

  //TODO:Add icon to show the password field
  //TODO:Add full name field
  //TODO: Add authentication with facebook and google

  TextField getTextField(
      {String hintText,
      bool isObscureText: false,
      TextInputType keyboardType}) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: isObscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: kInputFieldFillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 70.0),
        padding:
            EdgeInsets.only(top: 50.0, right: 30.0, bottom: 20.0, left: 30.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/app_launch.png"),
              radius: 70.0,
            ),
            getTextField(
                hintText: "Correo", keyboardType: TextInputType.emailAddress),
            SizedBox(
              height: 10.0,
            ),
            getTextField(hintText: "Contraseña", isObscureText: true),
            SizedBox(
              height: 10.0,
            ),
            PrimaryFlatButton(
              title: "Registrar",
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () {},
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
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
            ),
            SizedBox(
              height: 10.0,
            ),
            socialMediaAuthButton(
                onTap: () {
                  print("Social Media Auth Button");
                },
                buttonImage: ("images/icons/facebook-logo.png"),
                buttonTitle: "Registrarse con Facebook",
                buttonBackgroundColor: Color(0xff4A6EA8),
                textColor: Colors.white,
                borderColor: Colors.transparent),
            SizedBox(
              height: 15.0,
            ),
            socialMediaAuthButton(
                onTap: () {
                  print("Social media auth button GOOGLE");
                },
                buttonTitle: "Registrarse con Google",
                buttonImage: "images/icons/google-logo.png",
                textColor: Colors.grey,
                borderColor: Colors.grey),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(text: "Al registrarse, acepta los"),
                      TextSpan(
                          text: "Términos de servicio",
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(text: " y la "),
                      TextSpan(
                          text: "Política de privacidad",
                          style: TextStyle(color: Colors.blue))
                    ]),
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "¿Ya tienes una cuenta?"),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("display login screen");
                          },
                        text: " Inciar sesión",
                        style: TextStyle(color: Colors.blue))
                  ], style: TextStyle(fontSize: 16.0)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector socialMediaAuthButton(
      {String buttonTitle,
      Function onTap,
      String buttonImage,
      Color buttonBackgroundColor,
      Color textColor,
      Color borderColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                      image: AssetImage(buttonImage), fit: BoxFit.none),
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
      ),
    );
  }
}
