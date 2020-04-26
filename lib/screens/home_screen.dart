import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final String id = "home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(40.0),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/app_launch.png"),
                    radius: 100.0,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    child: Text(
                      "FIXALFA",
                      style: TextStyle(
                          fontSize: 40,
                          letterSpacing: 5.0,
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor),
                    ),
                  ),
                  Text(
                    "Encuentra servicios cerca de ti",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Button(
                    title: "Registrarse",
                    onTap: () {
                      Navigator.pushNamed(context, '/signUpScreen');
                    },
                  ),
                  SecondaryButton(
                    title: "Iniciar sesión",
                    margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  ),
                  Text(
                    "Omitir por ahora",
                    style: (TextStyle(fontSize: 20, color: kSecondaryColor)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({this.title, this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        height: 50.0,
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w300),
        )),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  SecondaryButton({this.title, this.margin});
  final String title;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      height: 50.0,
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            fontSize: 20.0,
            color: kPrimaryColor,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w300),
      )),
    );
  }
}
