import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_shop/core/data/repositories/user/user_repository.dart';
import 'package:get_shop/core/data/sources/remote/remote_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDataSource _remoteDataSource;
  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<bool> deleteUser(String password) async {
    return await _remoteDataSource.deleteUser(password);
  }

  @override
  Future<DocumentSnapshot> getUser(dynamic uid) async {
    return await _remoteDataSource.getUser(uid);
  }

  @override
  Future<DocumentSnapshot> createUser(dynamic userReg) async {
    return await _remoteDataSource.createUser(userReg);
  }

  @override
  Future<void> editUser(String id, Map<String, dynamic> user) async {
    return await _remoteDataSource.editUser(id, user);
  }

  @override
  Future<void> addUserPhoto(String id, Map<String, dynamic> user) async {
    return await _remoteDataSource.addUserPhoto(id, user);
  }

  @override
  Future<void> deleteUserFromCollection(String id) async {
    return await _remoteDataSource.deleteUserFromCollection(id);
  }
}