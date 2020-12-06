import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      String id = _firebaseAuth.currentUser.getIdToken().toString();
      Map usuario;
      FirebaseFirestore.instance
          .collection("empresa")
          .doc(id)
          .get()
          .then((value) {
        usuario = value.data();
      });
      if (usuario.isNotEmpty) return '1';
      return '0';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<FirebaseAuth> usuario() async {
    return _firebaseAuth;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> getEmail() async {
    return _firebaseAuth.currentUser.email.toString();
  }

  Future<void> mandaEmail() async {
    await _firebaseAuth.sendPasswordResetEmail(email: null);
  }

  Future<String> testaemail(String codigo) async {
    return await _firebaseAuth.verifyPasswordResetCode(codigo);
  }

  Future<String> idAtual() async {
    return _firebaseAuth.currentUser.getIdToken().toString();
  }

  Future<void> changePass() async {
    await _firebaseAuth.confirmPasswordReset();
  }

  Future<String> signUpUser({
    String email,
    String nome,
    String tel,
    String cpf,
    String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseFirestore.instance.collection('Usuarios').add({
        "nome": nome,
        "Telefone": tel,
        "cpf": cpf,
        "UserID": _firebaseAuth.currentUser.getIdToken().toString()
      });
      return "Singed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUpEmp({
      String email,
      String password,
      String nome,
      String cnpj,
      String tel}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseFirestore.instance.collection('empresa').add({
        "cnpj": cnpj,
        "telefone": tel,
        "nome": nome,
        "UserID": _firebaseAuth.currentUser.getIdToken().toString()
      });
      return "Singed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
