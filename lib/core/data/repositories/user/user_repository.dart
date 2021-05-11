import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_shop/core/base/base_repository.dart';

abstract class UserRepository extends BaseRepository {

  Future<bool> deleteUser(String password);

  Future<DocumentSnapshot> getUser(uid);

  Future<DocumentSnapshot> createUser(userReg);

  Future<void> editUser(String id, Map<String, dynamic> user);

  Future<void> addUserPhoto(String id, Map<String, dynamic> user);

  Future<void> deleteUserFromCollection(String id);

}

