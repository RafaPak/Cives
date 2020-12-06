import 'package:cives_app/userPages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'evento.dart';

class Events extends StatelessWidget {
  final PageController controller;
  static List dados = new List();
  var snapshot =
      FirebaseFirestore.instance.collection('eventos').get().then((value) {
    value.docs.forEach((element) {
      dados.add(element.data());
    });
  });
  Events(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(controller),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Eventos",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        ListView.builder(
          padding: EdgeInsets.all(4.0),
          itemCount: dados.length,
          itemBuilder: (context, index) {
            return InkWell(
                customBorder: OutlineInputBorder(),
                child: Card(
                  child: Row(children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: Text(
                          "Evento: " + dados.elementAt(index)['nome'],
                          style: TextStyle(
                              color: Colors.lightBlue, fontSize: 25.0),
                        )),
                    Flexible(
                      flex: 1,
                      child: Text(
                        "Descricao: " + dados.elementAt(index)['desc'],
                        style:
                            TextStyle(color: Colors.lightBlue, fontSize: 25.0),
                      ),
                    )
                  ]),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventoUser(
                              this.controller, dados.elementAt(index))));
                });
          },
        )
      ]),
    );
  }
}
