part of binding;

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()), fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()), fenix: true);
    Get.lazyPut<AdvertsRepository>(() => AdvertsRepositoryImpl(Get.find()), fenix: true);
  }
}