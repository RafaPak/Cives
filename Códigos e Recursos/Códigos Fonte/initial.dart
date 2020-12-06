import 'package:cives_app/userPages/mapa.dart';
import 'package:cives_app/userPages/events.dart';
import 'package:cives_app/userPages/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cives_app/loginPages/login.dart';

class InitPag extends StatefulWidget {
  Map user;
  var email = usuario.currentUser.email;

  InitPag() {
    FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(usuario.currentUser.getIdToken().toString())
        .get()
        .then((value) {
      user = value.data();
    });
  }
  @override
  _InitPagState createState() => _InitPagState();
}

class _InitPagState extends State<InitPag> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Mapa(_pageController),
          Events(_pageController),
          PerfilUser(
              _pageController,
              widget.user['nome'],
              widget.email.toString(),
              widget.user['Telefone'],
              widget.user['cpf']),
        ]);
  }
}
