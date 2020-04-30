import 'package:app/colors.dart';
import 'package:app/constants.dart';
import 'package:app/screens/cockpit.dart';
import 'package:app/screens/registration_screen.dart';
import 'package:app/screens/signin_screen.dart';
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          color: Colors.white,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 150.0),
                  child: Column(
                    children: [
                      Text(
                        "FIXALFA",
                        style: kLogoTypeStyle(color: kFixalfaGreen500),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    getFlatButton(
                        title: "Registrarse",
                        color: kFixalfaGreen500,
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    getFlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.id);
                        },
                        title: "Iniciar Sesión",
                        borderSideColor: kFixalfaGreen500,
                        textColor: kFixalfaGreen500),
                    SizedBox(
                      height: 60.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CockpitScreen.id);
                        },
                        child: Text(
                          "Omitir por ahora",
                          style:
                              (TextStyle(fontSize: 20, color: kFixalfaAmber)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
