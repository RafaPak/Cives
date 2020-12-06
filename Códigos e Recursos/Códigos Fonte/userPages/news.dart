import 'package:cives_app/userPages/drawer.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final PageController controller;
  News(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(controller),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Notícias",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          /* ListView.builder(
                padding: EdgeInsets.all(4.0),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return InkWell(
                    customBorder: OutlineInputBorder(),
                    child: Card(
                      child: Row(children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Text(
                            "Notícia: Modelo\nData: 11/11/11",
                            style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
                          ),
                          onClick() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NoticiaUser()));
                          }
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            "Descricao: Anúncio de festa de formatura dos estudantes do colegio tecnico de campinas",
                            style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
                          ),
                        )
                      ]),
                    ),
                  );
                },
              ) */
        ]));
  }
}
