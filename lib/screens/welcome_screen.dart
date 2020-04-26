import 'package:app/components/small_circlar_shape.dart';
import 'package:app/constants.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "welcome_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/get-started-background.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 50.0, left: 40.0, right: 20.0, top: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Hola,",
                                style: kGetStartedTitle,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Bienvenidos.",
                                style: kGetStartedInfoText,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Aquí podrás encontrar todo tipo de técnicos y profesionales",
                                style: kGetStartedInfoText,
                              ),
                            ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SmallCircularShape(),
                              SizedBox(
                                width: 10.0,
                              ),
                              SmallCircularShape(),
                              SizedBox(
                                width: 10.0,
                              ),
                              SmallCircularShape(
                                width: 40.0,
                                height: 5.0,
                                borderRadius: 70.0,
                              )
                            ],
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, HomeScreen.id);
                            },
                            color: kSecondaryColor,
                            child: Text(
                              "Comenzar",
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                height: 430.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
