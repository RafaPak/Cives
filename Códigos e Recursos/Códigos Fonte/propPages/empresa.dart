import 'package:flutter/material.dart';
import 'drawerEmp.dart';

//PerfilEmp extends StatelessWidget {

class PerfilEmp extends StatefulWidget {
  final PageController controller;
  final String nome, cnpj, email, telefone, endereco;
  PerfilEmp(this.controller, String emp, String cnpjP, String emailP,
      String tel, String end)
      : this.nome = emp,
        this.endereco = end,
        this.cnpj = cnpjP,
        this.email = emailP,
        this.telefone = tel;

  @override
  _PerfilEmpState createState() => _PerfilEmpState();
}

class _PerfilEmpState extends State<PerfilEmp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawerEmp(widget.controller),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Eventos",
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
                  "Empresa: " + widget.nome,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
                Divider(color: Colors.white, height: 20.0),
                Text(
                  "CNPJ: " + widget.cnpj,
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
                  "Endereço: " + widget.endereco,
                  style: TextStyle(fontSize: 25.0, color: Colors.lightBlue),
                  textAlign: TextAlign.left,
                ),
              ]),
        ));
  }
}
