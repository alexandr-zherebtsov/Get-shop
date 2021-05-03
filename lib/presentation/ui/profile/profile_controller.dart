import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/strings.dart';
import 'package:get_shop/core/models/user_model.dart';
import 'package:get_shop/core/services/auth_service.dart';
import 'package:get_shop/core/services/user_service.dart';
import 'package:get_shop/presentation/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _fb = FirebaseAuth.instance;
  final AuthService _authService = AuthService();
  RxBool callCheck = false.obs;
  RxBool isLoading = false.obs;
  String currentUserUid = '';
  late UserModel user;

  Future<void> initUser(String uid) async {
    isLoading(true);
    currentUserUid = _fb.currentUser!.uid;
    DocumentSnapshot res = await UserService().getUser(uid);
    user = UserModel(
      id: res.data()![AppStrings.userModelId],
      photo: res.data()![AppStrings.userModelPhoto],
      name: res.data()![AppStrings.userModelName],
      surname: res.data()![AppStrings.userModelSurname],
      city: res.data()![AppStrings.userModelCity],
      email: res.data()![AppStrings.userModelEmail],
      phoneNumber: res.data()![AppStrings.userModelPhoneNumber],
      aboutYourself: res.data()![AppStrings.userModelAboutYourself],
    );
    isLoading(false);
  }

  void callFunc(String phoneNumber) {
    if (callCheck.value) {
      launch('tel://$phoneNumber');
      callCheck(false);
      Future.delayed(const Duration(seconds: 2), () => callCheck(true));
    }
  }

  void logOut() async {
    isLoading(true);
    await _authService.logOut();
    isLoading(false);
    Get.offAllNamed(AppRoutes.splash);
  }

  void navBack() {
    Get.back();
  }
}
