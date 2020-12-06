import 'package:cives_app/initial.dart';
import 'package:cives_app/servicos/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

AuthenticationService a = AuthenticationService();
FirebaseAuth usuario;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 70.0, bottom: 30.0),
                  child: Image.asset(
                    "images/CivesLogo.png",
                  )),
              buildContainerText("Email", email),
              Divider(color: Colors.white, height: 20.0),
              buildContainerText("Senha", senha),
              Divider(color: Colors.white, height: 40.0),
              Container(
                  height: 50.0,
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: RaisedButton(
                      onPressed: () {
                        var res;
                        a.signIn().then((value) {
                          res = value;
                        });
                        a.usuario().then((value) {
                          usuario = value;
                        });
                        if (res == '0')
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitPag()));
                        if (res == '1')
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitPag()));
                        else
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text("Logar",
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.0)),
                      color: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0))))
            ],
          ),
        ));
  }
}

Widget buildContainerText(String label, TextEditingController controle) {
  return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
            border: OutlineInputBorder()),
        style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
        controller: controle,
      ));
}
