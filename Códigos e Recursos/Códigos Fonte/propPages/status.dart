import 'package:flutter/material.dart';
import 'drawerEmp.dart';

class StatusEmp extends StatelessWidget {
  final PageController controller;
  final horarios;
  StatusEmp(this.controller, var hors) : this.horarios = hors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawerEmp(controller),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Horários de Funcionamento",
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
                  "Domingo: " + horarios[0],
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Segunda-feira: " + horarios[1],
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Terça-feira: " + horarios[2],
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Quarta-feira: " + horarios[3],
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Quinta-feira: " + horarios[4],
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Sexta-feira: " + horarios[5],
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Sábado: " + horarios[6],
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                )
              ]),
        ));
  }
}
