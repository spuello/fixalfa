import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff1E824C);
const Color kSecondaryColor = Color(0xffFFC107);
const Color kSecondaryColor2 = Color(0xffFFE59A);
const Color kInputFieldFillColor = Color(0xfff0f7f3);

const kWelcomeLogoStyle = TextStyle(
    fontSize: 60.0,
    color: Colors.white,
    fontWeight: FontWeight.w900,
    letterSpacing: 15.0);

TextStyle kWelcomeLogoStyle2({Color color, double letterSpacing: 15.0}) =>
    TextStyle(
        fontSize: 60.0,
        color: color,
        fontWeight: FontWeight.w900,
        letterSpacing: letterSpacing);

const kWelcomeLogoSubtitleStyle =
    TextStyle(color: kSecondaryColor, fontSize: 18.0);

const kWelcomeTitleStyle = TextStyle(
    fontSize: 40.0, color: kPrimaryColor, fontWeight: FontWeight.w700);

const kWelcomeSubtitleStyle = TextStyle(fontSize: 20.0, height: 1.30);

const kWelcomeGetStartedBtnStyle =
    TextStyle(color: Colors.white, fontSize: 20.0);
