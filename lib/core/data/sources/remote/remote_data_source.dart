import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_shop/core/models/advert_model.dart';

abstract class RemoteDataSource {

  Future<bool> signInEmailPassword(String email, String password);

  Future<void> registerEmailPassword(String email, String password);

  Future<void> logOut();

  Future<bool> deleteUser(String password);

  Future<DocumentSnapshot> getUser(uid);

  Future<DocumentSnapshot> createUser(userReg);

  Future<void> editUser(String id, Map<String, dynamic> user);

  Future<void> addUserPhoto(String id, Map<String, dynamic> user);

  Future<void> deleteUserFromCollection(String id);

  Future<List<AdvertModel>> getAdverts();

  Future<void> createAdvert(AdvertModel createAdvert);

  Future<List<AdvertModel>> getMyAdverts(String uid);

  Future<List<AdvertModel>> getMySavedAdverts(String uid);

  Future<void> editAdvert(String id, Map<String, dynamic> advert);

  Future<void> toSavedAdvert(String id, Map<String, dynamic> advert);

  Future<void> deleteAdvert(String id);

}