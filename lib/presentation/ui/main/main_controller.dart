import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/presentation/router/router.dart';
import 'package:get_shop/presentation/ui/adverts_all/adverts_all_screen.dart';
import 'package:get_shop/presentation/ui/profile/profile_screen.dart';

class MainController extends GetxController {
  String? currentUid;
  List<Widget> screens = <Widget>[];

  @override
  void onInit() async {
    currentUid = FirebaseAuth.instance.currentUser!.uid;
    screens = [
      AdvertsAllScreen(),
      ProfileScreen(uid: currentUid!),
    ];
    super.onInit();
  }

  RxInt count = 0.obs;
  int changeCount(int value) => count.value = value;

  void navToSplash() => Get.offAndToNamed(AppRoutes.splash);
}