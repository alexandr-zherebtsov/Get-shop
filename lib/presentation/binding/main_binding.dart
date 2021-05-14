part of binding;

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<AdvertsAllController>(() => AdvertsAllController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
