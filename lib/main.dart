import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/localization.dart';
import 'package:get_shop/common/theme_data.dart';
import 'package:get_shop/presentation/binding/binding_imports.dart';
import 'package:get_shop/presentation/router/router_imports.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppLocalization.textGShop,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
      defaultTransition: Transition.cupertino,
      theme: AppThemeData.darkTheme,
      initialBinding: GlobalBinding(),
    );
  }
}
