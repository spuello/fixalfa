import 'package:flutter/material.dart';

class CockpitScreen extends StatefulWidget {
  static const String id = "cockpit_screen";
  @override
  _CockpitScreenState createState() => _CockpitScreenState();
}

class _CockpitScreenState extends State<CockpitScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("COCKPIT SCREEN")));
  }
}
