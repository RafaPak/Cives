import 'package:cives_app/propPages/empresa.dart';
import 'package:cives_app/propPages/eventsEmp.dart';
import 'package:cives_app/propPages/mapaEmp.dart';
import 'package:cives_app/propPages/status.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cives_app/loginPages/login.dart';

class InitPropPag extends StatelessWidget {
  final _pageController = PageController();
  Map empresa;
  final String email = usuario.currentUser.email;
  InitPropPag() {
    FirebaseFirestore.instance
        .collection('empresa')
        .doc(usuario.currentUser.getIdToken().toString())
        .get()
        .then((value) {
      this.empresa = value.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          MapaEmp(_pageController),
          EventEmp(_pageController),
          StatusEmp(_pageController, empresa['horarios']),
          PerfilEmp(_pageController, empresa['nome'], empresa['cnpj'], email,
              empresa['telefone'], empresa['endereco']),
        ]);
  }
}
