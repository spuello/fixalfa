import 'package:app/blocs/authentication/authentication_bloc.dart';
import 'package:app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CockpitScreen extends StatelessWidget {
  static const String id = "cockpit_screen";

  List<ListTile> _categories = <ListTile>[];

  List<Widget> getCategories(int num) {
    for (int i = 0; i < num; i++) {
      _categories.add(ListTile(
        onTap: () {
          //Navigator.pushNamed(context, Technicians.id);
        },
        title: Text("Categoria #$i"),
        trailing: Icon(Icons.arrow_forward_ios),
      ));
    }
    return _categories;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categorías",
          style: TextStyle(fontSize: 30.0, letterSpacing: 1),
        ),
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          onPressed: () {},
//        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'FIXALFA',
                style: TextStyle(
                    color: kFixalfaGreen400,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 1.5),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("CORREO DEL USUARIO"),
            ),
            ListTile(
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Cerrar sesión"),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Positioned(
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                decoration: BoxDecoration(
                    color: kFixalfaGreen50,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),

                //margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30.0, bottom: 25.0),
                      child: Text(
                        "¿Presenta un problema?",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: kFixalfaGreen500),
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.search,
                          size: 40.0,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Busque por un servicio",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * .60,
                padding: EdgeInsets.only(right: 20.0, left: 30.0, top: 30.0),
                child: ListView(
                  children: getCategories(25),
                ),
                decoration: (BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
