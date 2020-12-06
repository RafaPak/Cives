import 'cadastroProp.dart';
import 'package:flutter/material.dart';
import 'cadastroUser.dart';

// FEITO
class PreCadastro extends StatefulWidget {
  @override
  _PreCadastroState createState() => _PreCadastroState();
}

class _PreCadastroState extends State<PreCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 120.0, bottom: 50.0),
              child: Image.asset(
                "images/CivesLogo.png",
              )),
          Container(
              height: 50.0,
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CadastroProp()));
                  },
                  child: Text("Sou Proprietário",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)))),
          Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Container(
                  height: 50.0,
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroUser()));
                      },
                      child: Text("Sou Usuário",
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.0)),
                      color: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)))))
        ],
      ),
    );
  }
}
