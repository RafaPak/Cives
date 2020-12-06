import 'package:flutter/material.dart';
import '../initialProp.dart';
import 'package:cives_app/servicos/auth.dart';

//func feita
class CadastroProp extends StatefulWidget {
  @override
  _CadastroPropState createState() => _CadastroPropState();
}

class _CadastroPropState extends State<CadastroProp> {
  TextEditingController cnpj = TextEditingController();
  TextEditingController nomeEmp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confSenha = TextEditingController();
  TextEditingController tel = TextEditingController();

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
            buildContainerText("CNPJ", cnpj, false, TextInputType.number),
            Divider(color: Colors.white, height: 20.0),
            buildContainerText(
                "Nome da Empresa", nomeEmp, false, TextInputType.text),
            Divider(color: Colors.white, height: 20.0),
            buildContainerText(
                "Email", email, false, TextInputType.emailAddress),
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
                      AuthenticationService a = AuthenticationService();
                      a.signUpEmp(
                          email: email.text,
                          password: senha.text,
                          nome: nomeEmp.text,
                          cnpj: cnpj.text,
                          tel: tel.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InitPropPag()));
                    },
                    child: Text("Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))))
          ],
        )));
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
