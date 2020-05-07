import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle kLogoTypeStyle({Color color, double letterSpacing: 15.0}) =>
    TextStyle(
        fontSize: 60.0,
        color: color,
        fontWeight: FontWeight.w900,
        letterSpacing: letterSpacing);

const kWelcomeLogoSubtitleStyle =
    TextStyle(color: kFixalfaAmber, fontSize: 18.0);

const kWelcomeTitleStyle = TextStyle(
    fontSize: 40.0, color: kFixalfaGreen500, fontWeight: FontWeight.w700);

const kWelcomeSubtitleStyle = TextStyle(fontSize: 20.0, height: 1.30);

const kWelcomeGetStartedBtnStyle =
    TextStyle(color: Colors.white, fontSize: 20.0);
