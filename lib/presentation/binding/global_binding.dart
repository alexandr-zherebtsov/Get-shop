import 'package:get/get.dart';
import 'package:get_shop/core/data/repositories/adverts/adverts_repository.dart';
import 'package:get_shop/core/data/repositories/adverts/adverts_repository_impl.dart';
import 'package:get_shop/core/data/repositories/auth/auth_repository.dart';
import 'package:get_shop/core/data/repositories/auth/auth_repository_impl.dart';
import 'package:get_shop/core/data/repositories/user/user_repository.dart';
import 'package:get_shop/core/data/repositories/user/user_repository_impl.dart';
import 'package:get_shop/core/data/sources/remote/remote_data_source.dart';
import 'package:get_shop/core/data/sources/remote/remote_data_source_impl.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()), fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()), fenix: true);
    Get.lazyPut<AdvertsRepository>(() => AdvertsRepositoryImpl(Get.find()), fenix: true);
  }
}