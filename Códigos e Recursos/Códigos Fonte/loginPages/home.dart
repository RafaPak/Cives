import 'package:cives_app/loginPages/preCadastro.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PreCadastro()));
                  },
                  child: Text("Cadastro",
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text("Login",
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
