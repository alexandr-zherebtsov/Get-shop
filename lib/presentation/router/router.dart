part of router;

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