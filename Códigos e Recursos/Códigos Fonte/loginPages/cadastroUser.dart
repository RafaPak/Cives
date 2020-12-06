import 'package:cives_app/initial.dart';
import 'package:cives_app/servicos/auth.dart';
import 'package:flutter/material.dart';

// func feita

class CadastroUser extends StatefulWidget {
  @override
  _CadastroUserState createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  final AuthenticationService a = AuthenticationService();
  TextEditingController nome = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confSenha = TextEditingController();

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
              buildContainerText("Nome", nome, false, TextInputType.text),
              Divider(color: Colors.white, height: 20.0),
              buildContainerText("Email", email, false, TextInputType.text),
              Divider(color: Colors.white, height: 20.0),
              buildContainerText("CPF", cpf, false, TextInputType.number),
              Divider(color: Colors.white, height: 20.0),
              buildContainerText("Telefone", tel, false, TextInputType.phone),
              Divider(color: Colors.white, height: 20.0),
              buildContainerText("Senha", senha, true, TextInputType.text),
              Divider(color: Colors.white, height: 20.0),
              buildContainerText(
                  "Confirmar Senha", confSenha, true, TextInputType.text),
              Divider(color: Colors.white, height: 40.0),
              Container(
                  height: 50.0,
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: RaisedButton(
                      onPressed: () {
                        a
                            .signUpUser(
                                email: email.text,
                                nome: nome.text,
                                tel: tel.text,
                                cpf: cpf.text,
                                password: confSenha.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitPag()));
                        });
                      },
                      child: Text("Cadastrar",
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

Widget buildContainerText(String label, TextEditingController controle,
    bool senha, TextInputType tipo) {
  return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextField(
        keyboardType: tipo,
        obscureText: senha,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
            border: OutlineInputBorder()),
        style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
        controller: controle,
      ));
}
