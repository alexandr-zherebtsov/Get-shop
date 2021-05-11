import 'package:get_shop/core/base/base_repository.dart';

abstract class AuthRepository extends BaseRepository {

  Future<bool> signInEmailPassword(String email, String password);

  Future<void> registerEmailPassword(String email, String password);

  Future<void> logOut();

}