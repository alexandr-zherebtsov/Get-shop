import 'package:get_shop/core/data/repositories/auth/auth_repository.dart';
import 'package:get_shop/core/data/sources/remote/remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<bool> signInEmailPassword(String email, String password) async {
    return await _remoteDataSource.signInEmailPassword(email, password);
  }

  @override
  Future<void> registerEmailPassword(String email, String password) async {
    return await _remoteDataSource.registerEmailPassword(email, password);
  }

  @override
  Future<void> logOut() async {
    return await _remoteDataSource.logOut();
  }
}
