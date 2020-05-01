import 'package:app/colors.dart';
import 'package:app/screens/vendor_screen.dart';
import 'package:flutter/material.dart';

class Technicians extends StatefulWidget {
  static const String id = "technicians-screen";
  @override
  _TechniciansState createState() => _TechniciansState();
}

class _TechniciansState extends State<Technicians> {
  List<Widget> technicianServiceList() {
    List _technicianList = <Widget>[];

    _technicianList.add(Container(
      padding: EdgeInsets.only(left: 20.0, top: 20.0),
      child: Text(
        "Técnicos & Profesionales",
        style: TextStyle(fontSize: 20.0),
      ),
    ));

    for (int i = 0; i < 5; i++) {
      _technicianList.add(
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, VendorScreen.id);
          },
          contentPadding: EdgeInsets.all(10.0),
          leading: Image.network("https://robohash.org/$i"),
          title: Text(
            "Domingo Faustino Sarmiento",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Ebanista",
                      style: TextStyle(
                          fontSize: 16.0, fontStyle: FontStyle.italic)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Servicios",
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                ),
                Text("Servicio #1"),
                Text("Servicio #1"),
                Text("Servicio #1"),
                Text("Servicio #1"),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                )
              ]),
        ),
      );
    }

    return _technicianList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categoría seleccionada"),
        ),
        body: Container(
          color: kFixalfaBackgroundWhite,
          child: ListView(
            children: technicianServiceList(),
          ),
        ));
  }
}
