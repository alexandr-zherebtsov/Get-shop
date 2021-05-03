import 'package:get/get.dart';
import 'package:get_shop/presentation/ui/adverts_all/adverts_all_controller.dart';
import 'package:get_shop/presentation/ui/main/main_controller.dart';
import 'package:get_shop/presentation/ui/profile/profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<AdvertsAllController>(() => AdvertsAllController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
