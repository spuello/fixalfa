import 'package:app/colors.dart';
import 'package:flutter/material.dart';

class VendorScreen extends StatefulWidget {
  static const String routeName = "vendor_screen";
  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://robohash.org/6"))),
                    height: MediaQuery.of(context).size.height * 0.40,
                  ),
                ),
                Positioned(
                  bottom: 50.0,
                  child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Michael Ramírez",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: kFixalfaBackgroundWhite,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: kFixalfaGreen400,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage("https://robohash.org/3"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: kFixalfaBackgroundWhite,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0))),
            height: MediaQuery.of(context).size.height * .50,
            child: ListView(
              children: _getServices(),
            ),
          ),
        ],
      ),
    );
  }

  _getServices() {
    List<Widget> services = [];
    services.add(Text(
      "Servicios",
      style: TextStyle(
          fontSize: 30.0, color: kFixalfaGreen400, fontWeight: FontWeight.bold),
    ));

    for (int i = 1; i < 10; i++) {
      services.add(Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Servicio #$i",
                style: TextStyle(fontSize: 20.0),
              ),
              Text("Descripción")
            ],
          ),
        ),
      ));
    }
    return services;
  }
}
