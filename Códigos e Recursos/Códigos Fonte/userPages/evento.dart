import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventoUser extends StatelessWidget {
  final PageController controller;
  String nome, data, local, desc, empresa;
  EventoUser(this.controller, var evento) {
    this.nome = evento['nome'];
    this.data = evento['data'];
    this.local = evento['endereco'];
    FirebaseFirestore.instance
        .collection(empresa)
        .doc(evento['empresa'].toString())
        .get()
        .then((value) {
      this.empresa = value.data()['nome'];
    });
    this.desc = evento['descrição'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Evento",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Nome: " + this.nome + " (" + this.empresa + ")",
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Data: " + this.data,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Local: " + this.local,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Descrição: " + this.desc,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                )
              ]),
        ));
  }
}
