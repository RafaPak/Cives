import 'package:cives_app/userPages/drawer.dart';
import 'package:flutter/material.dart';

class PerfilUser extends StatefulWidget {
  final PageController controller;
  final String nome, email, telefone, cpf;
  PerfilUser(this.controller, String nom, String emai, String tel, String cpfP)
      : this.nome = nom,
        this.email = emai,
        this.telefone = tel,
        this.cpf = cpfP;
  @override
  _PerfilUserState createState() => _PerfilUserState();
}

class _PerfilUserState extends State<PerfilUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(widget.controller),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Usuário",
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
                  "Nome: " + widget.nome,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Email: " + widget.email,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "Telefone: " + widget.telefone,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "CPF: " + widget.cpf,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
              ]),
        ));
  }
}
