import 'package:app/colors.dart';
import 'package:app/constants.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "welcome_screen";

  Container circularShape(
      {double height: 5.0,
      double width: 5.0,
      double borderRadius: 50.0,
      Color color}) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFixalfaGreen500,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "FIXALFA",
                      style: kLogoTypeStyle(color: kFixalfaBackgroundWhite),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Solución oportuna a tus problemas",
                      style: kWelcomeLogoSubtitleStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(
                  top: 50.0, left: 40.0, bottom: 40.0, right: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Hola,\n¡Bienvenido!",
                        style: kWelcomeTitleStyle,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "A un océano de servicios técnicos y profesionales.",
                        style: kWelcomeSubtitleStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          circularShape(
                            color: Colors.grey,
                          ),
                          circularShape(
                            color: Colors.grey,
                          ),
                          circularShape(
                            color: kFixalfaAmber,
                            height: 8.0,
                            width: 25.0,
                          ),
                        ],
                      ),
                      FlatButton(
                        color: kFixalfaAmber,
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15.0),
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.id);
                        },
                        child: Text(
                          "Comenzar",
                          style: kWelcomeGetStartedBtnStyle,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                      )
                    ],
                  )
                ],
              ),
              decoration: (BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
