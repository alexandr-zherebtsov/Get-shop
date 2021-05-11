import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_shop/common/strings.dart';
import 'package:get_shop/core/data/sources/remote/remote_data_source.dart';
import 'package:get_shop/core/models/advert_model.dart';
import 'package:get_shop/core/network/exception_handler.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final JsonDecoder _decoder = JsonDecoder();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
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

  Future<DocumentSnapshot> getUser(uid) async {
    return await _db
        .collection(AppStrings.collectionUsers)
        .doc(uid)
        .get()
        .catchError((e) {
      handleErrorApp(e, decoder: _decoder);
    });
  }

  Future<DocumentSnapshot> createUser(userReg) async {
    final userData = FirebaseAuth.instance.currentUser!;
    return await _db
        .collection(AppStrings.collectionUsers)
        .doc('${userData.uid}')
        .set(userReg)
        .then((value) => getUser(userData.uid))
        .catchError((e) {
      handleErrorApp(e, decoder: _decoder);
    });
  }

  Future<void> editUser(String id, Map<String, dynamic> user) async {
    try {
      await _db.collection(AppStrings.collectionUsers).doc(id).update(user);
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<void> addUserPhoto(String id, Map<String, dynamic> user) async {
    try {
      await _db.collection(AppStrings.collectionUsers).doc(id).update(user);
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<void> deleteUserFromCollection(String id) async {
    try {
      await _db.collection(AppStrings.collectionUsers).doc(id).delete();
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<List<AdvertModel>> getAdverts() async {
    QuerySnapshot res = await _db.collection(AppStrings.collectionAdverts).orderBy(AppStrings.advertModelUpdatedAt).get();
    List<AdvertModel> advertsList = [];
    try {
      res.docs.forEach((e) {
        advertsList.add(AdvertModel(
          id: e.id,
          uid: e[AppStrings.advertModelUid] ?? '',
          headline: e[AppStrings.advertModelHeadline] ?? '',
          price: e[AppStrings.advertModelPrice] ?? '' as int?,
          description: e[AppStrings.advertModelDescription] ?? '',
          images: e[AppStrings.advertModelImages] ?? [],
          createdAt: e[AppStrings.advertModelCreatedAt],
          updatedAt: e[AppStrings.advertModelUpdatedAt],
          saved: e[AppStrings.advertModelSaved] ?? [],
        ));
      });
    } catch(e) {
      handleErrorApp(e, decoder: _decoder);
    }
    return advertsList.reversed.toList();
  }

  Future<void> createAdvert(AdvertModel createAdvert) async {
    return await _db.collection(AppStrings.collectionAdverts).doc(createAdvert.id).set({
      AppStrings.advertModelId: createAdvert.id,
      AppStrings.advertModelUid: createAdvert.uid,
      AppStrings.advertModelHeadline: createAdvert.headline,
      AppStrings.advertModelPrice: createAdvert.price,
      AppStrings.advertModelDescription: createAdvert.description,
      AppStrings.advertModelImages: createAdvert.images,
      AppStrings.advertModelCreatedAt: createAdvert.createdAt,
      AppStrings.advertModelUpdatedAt: createAdvert.updatedAt,
      AppStrings.advertModelSaved: createAdvert.saved,
    }).catchError((e) {
      handleErrorApp(e, decoder: _decoder);
    });
  }

  Future<List<AdvertModel>> getMyAdverts(String uid) async {
    QuerySnapshot res = await _db.collection(AppStrings.collectionAdverts).where(
      AppStrings.advertModelUid,
      isEqualTo: uid,
    ).orderBy(AppStrings.advertModelUpdatedAt).get();
    List<AdvertModel> advertsList = [];
    res.docs.forEach((e) {
      advertsList.add(AdvertModel(
        id: e.id,
        uid: e[AppStrings.advertModelUid] ?? '',
        headline: e[AppStrings.advertModelHeadline] ?? '',
        price: e[AppStrings.advertModelPrice] ?? '' as int?,
        description: e[AppStrings.advertModelDescription] ?? '',
        images: e[AppStrings.advertModelImages] ?? [],
        createdAt: e[AppStrings.advertModelCreatedAt],
        updatedAt: e[AppStrings.advertModelUpdatedAt],
        saved: e[AppStrings.advertModelSaved] ?? [],
      ));
    });
    return advertsList.reversed.toList();
  }

  Future<List<AdvertModel>> getMySavedAdverts(String uid) async {
    QuerySnapshot res = await _db.collection(AppStrings.collectionAdverts).where(
      AppStrings.advertModelSaved,
      arrayContains: uid,
    ).orderBy(AppStrings.advertModelUpdatedAt).get();
    List<AdvertModel> advertsList = [];
    res.docs.forEach((e) {
      advertsList.add(AdvertModel(
        id: e.id,
        uid: e[AppStrings.advertModelUid] ?? '',
        headline: e[AppStrings.advertModelHeadline] ?? '',
        price: e[AppStrings.advertModelPrice] ?? '' as int?,
        description: e[AppStrings.advertModelDescription] ?? '',
        images: e[AppStrings.advertModelImages] ?? [],
        createdAt: e[AppStrings.advertModelCreatedAt],
        updatedAt: e[AppStrings.advertModelUpdatedAt],
        saved: e[AppStrings.advertModelSaved] ?? [],
      ));
    });
    return advertsList.reversed.toList();
  }

  Future<void> editAdvert(String id, Map<String, dynamic> advert) async {
    print(advert);
    try {
      await _db.collection(AppStrings.collectionAdverts).doc(id).update(advert);
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<void> toSavedAdvert(String id, Map<String, dynamic> advert) async {
    try {
      await _db.collection(AppStrings.collectionAdverts).doc(id).update(advert);
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<void> deleteAdvert(String id) async {
    try {
      await _db.collection(AppStrings.collectionAdverts).doc(id).delete();
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }
}