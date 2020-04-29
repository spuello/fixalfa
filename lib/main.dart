import 'package:app/screens/cockpit.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/registration_screen.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FixAlfaApp());
}

class FixAlfaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        CockpitScreen.id: (context) => CockpitScreen()
      },
    );
  }
}
