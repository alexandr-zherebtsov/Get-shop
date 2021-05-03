import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_shop/core/network/exception_handler.dart';

class AuthService {
  final JsonDecoder _decoder = JsonDecoder();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> signInEmailPassword(String _email, String _password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);
      return true;
    }
    catch (e) {
      handleErrorApp(e, decoder: _decoder);
      return false;
    }
  }

  Future<void> registerEmailPassword(String _email, String _password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password);
    }
    catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<void> logOut() async{
    await _firebaseAuth.signOut();
  }

  Future<bool> deleteUser(String _password) async {
    try {
      await _firebaseAuth.currentUser!.delete();
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return false;
    }
  }
}
