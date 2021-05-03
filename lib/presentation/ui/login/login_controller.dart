import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/common/localization.dart';
import 'package:get_shop/core/network/exception_handler.dart';
import 'package:get_shop/core/services/auth_service.dart';
import 'package:get_shop/presentation/router/router.dart';
import 'package:get_shop/presentation/ui/widgets/toast.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final JsonDecoder _decoder = JsonDecoder();
  final AuthService _authService = AuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onReady() async{
    super.onReady();
  }

  void signInEmailPassword() async {
    try {
      await _authService.signInEmailPassword(emailController.text, passwordController.text);
      if (_firebaseAuth.currentUser != null) {
        Get.offAndToNamed(AppRoutes.splash);
      }
    } catch (e) {
      showToast(AppLocalization.textWrongData, AppColors.colorRed, AppColors.colorWhite);
      handleErrorApp(e, decoder: _decoder);
    }
  }

  void navToRegister() async {
    // Get.offAndToNamed(AppRoutes.register);
    FocusManager.instance.primaryFocus!.unfocus();
    emailController.clear();
    passwordController.clear();
  }

  void navToMain() {
    Get.offAndToNamed(AppRoutes.main);
  }
}