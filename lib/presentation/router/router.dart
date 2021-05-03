import 'package:get/get.dart';
import 'package:get_shop/presentation/binding/login_binding.dart';
import 'package:get_shop/presentation/binding/main_binding.dart';
import 'package:get_shop/presentation/binding/splash_binding.dart';
import 'package:get_shop/presentation/ui/login/login_screen.dart';
import 'package:get_shop/presentation/ui/main/main_screen.dart';
import 'package:get_shop/presentation/ui/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String main = '/main';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page:() => SplashScreen(), binding: SplashBinding()),
    GetPage(name: AppRoutes.login, page:() => LoginScreen(), binding: LoginBinding()),
    GetPage(name: AppRoutes.main, page:() => MainScreen(), binding: MainBinding()),
  ];
}