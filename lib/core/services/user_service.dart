import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_shop/core/network/exception_handler.dart';

class UserService {
  final JsonDecoder _decoder = JsonDecoder();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  String _collectionUsers = 'users';

  Future<DocumentSnapshot> getUser(uid) async {
    return await _db
        .collection(_collectionUsers)
        .doc(uid)
        .get()
        .catchError((e) {
      handleErrorApp(e, decoder: _decoder);
    });
  }

  Future<DocumentSnapshot> createUser(userReg) async {
    final userData = FirebaseAuth.instance.currentUser!;
    return await _db
        .collection(_collectionUsers)
        .doc('${userData.uid}')
        .set(userReg)
        .then((value) => getUser(userData.uid))
        .catchError((e) {
      handleErrorApp(e, decoder: _decoder);
    });
  }

  Future<void> editUser(String id, Map<String, dynamic> user) async {
    try {
      await _db.collection(_collectionUsers).doc(id).update(user);
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<void> addUserPhoto(String id, Map<String, dynamic> user) async {
    try {
      await _db.collection(_collectionUsers).doc(id).update(user);
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<void> deleteUserFromCollection(String id) async {
    try {
      await _db.collection(_collectionUsers).doc(id).delete();
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }
}
