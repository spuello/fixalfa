import 'package:app/colors.dart';
import 'package:app/screens/cockpit.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/registration_screen.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/screens/technicians-screen.dart';
import 'package:app/screens/vendor_screen.dart';
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
      theme: _kFixalfaTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        CockpitScreen.id: (context) => CockpitScreen(),
        Technicians.id: (context) => Technicians(),
        VendorScreen.id: (context) => VendorScreen()
      },
    );
  }
}

final ThemeData _kFixalfaTheme = _kBuildFixalfaTheme();

ThemeData _kBuildFixalfaTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kFixalfaGreen50,
    primaryColor: kFixalfaGreen500,
    scaffoldBackgroundColor: kFixalfaGreen400,
    appBarTheme: AppBarTheme().copyWith(
      color: kFixalfaGreen400,
      elevation: 0.0,
    ),
    primaryIconTheme: base.iconTheme.copyWith(color: Colors.white),
  );
}
