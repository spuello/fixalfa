import 'package:app/constants.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final String id = "home_screen";

  FlatButton getFlatButton(
      {String title,
      Color textColor: Colors.white,
      Color color: Colors.transparent,
      Color borderSideColor: Colors.transparent,
      Function onPressed}) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20.0, color: textColor, fontWeight: FontWeight.w300),
      ),
      padding: EdgeInsets.symmetric(vertical: 15.0),
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: borderSideColor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/app_launch.png"),
                      radius: 100.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
                      child: Text(
                        "FIXALFA",
                        style: kWelcomeLogoStyle2(
                            color: kPrimaryColor, letterSpacing: 0.0),
                      ),
                    ),
                    Text(
                      "Encuentra servicios cerca de ti",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        getFlatButton(
                            title: "Registrarse",
                            color: kPrimaryColor,
                            onPressed: () {
                              Navigator.pushNamed(context, SignUpScreen.id);
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        getFlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignInScreen.id);
                            },
                            title: "Iniciar Sesión",
                            borderSideColor: kPrimaryColor,
                            textColor: kPrimaryColor)
                      ],
                    ),
                    Text(
                      "Omitir por ahora",
                      style: (TextStyle(fontSize: 20, color: kSecondaryColor)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
