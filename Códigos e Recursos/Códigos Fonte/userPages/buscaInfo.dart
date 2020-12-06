import 'package:flutter/material.dart';
import 'drawer.dart';

class BuscaInfo extends StatelessWidget {
  final PageController controller;
  BuscaInfo(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(controller),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Busca",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquise aqui",
                  labelStyle:
                      TextStyle(color: Colors.lightBlue, fontSize: 18.0),
                  border: OutlineInputBorder()),
              style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
          )
        ]));
  }
}
