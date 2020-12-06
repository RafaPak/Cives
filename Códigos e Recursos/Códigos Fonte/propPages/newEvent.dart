import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cives_app/loginPages/login.dart';

class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  TextEditingController nomeEvento = TextEditingController();
  TextEditingController data = TextEditingController();
  TextEditingController local = TextEditingController();
  TextEditingController descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 30.0),
              child: Text(
                "Novo\nEvento",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
                textAlign: TextAlign.center,
              ),
            ),
            buildContainerText(
                "Nome do Evento", nomeEvento, TextInputType.text),
            Divider(color: Colors.white, height: 20.0),
            buildContainerText("Data", data, TextInputType.datetime),
            Divider(color: Colors.white, height: 20.0),
            Container(
                height: 100.0,
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Local",
                      labelStyle: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder()),
                  maxLines: 2,
                  style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
                  controller: local,
                )),
            Divider(color: Colors.white, height: 20.0),
            Container(
                height: 150.0,
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Descrição",
                      labelStyle: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder()),
                  maxLines: 5,
                  style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
                  controller: descricao,
                )),
            Divider(color: Colors.white, height: 80.0),
            Container(
                height: 50.0,
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: RaisedButton(
                    onPressed: () {
                      String id = a.idAtual().toString();
                      FirebaseFirestore.instance.collection('eventos').add({
                        'data': [
                          data.text.substring(0, 9),
                          data.text.substring(10)
                        ],
                        'descrição': descricao.text,
                        'empresa': id,
                        'endereco': local.text,
                        'nome': nomeEvento.text
                      });
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => EventEmp(controller)));
                    },
                    child: Text("Criar Evento",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))))
          ],
        )));
  }
}

Widget buildContainerText(
    String label, TextEditingController controle, TextInputType tipo) {
  return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextField(
        keyboardType: tipo,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
            border: OutlineInputBorder()),
        style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
        controller: controle,
      ));
}
