import 'package:get/get.dart';
import 'package:get_shop/presentation/ui/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}