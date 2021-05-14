part of splash;

class SplashController extends GetxController {
  Rx<Color>? bgColor = AppColors.colorWhite.obs;

  @override
  Future<void> onInit() async{
    // UserModel? user;
    // User? fbUser;
    // user = await initUser(fbUser);
    await futureDelayed(3000);
    if (FirebaseAuth.instance.currentUser != null) {
      navToMain();
    } else {
      navToLogin();
    }
    // if (fbUser == null) {
    //   navToLogin();
    // } else if (user == null) {
    //   navToRegisterData();
    // } else {
    //   navToMain();
    // }
    super.onInit();
  }

  // Future<UserModel?> initUser(User? fbUser) async {
  //   UserModel? user;
  //   try {
  //     if (fbUser != null) {
  //       final uid = fbUser.uid;
  //       final DocumentSnapshot? _res = await _userService.getUser(uid);
  //       _res == null ? user = null :
  //       user = UserModel(
  //         id: _res.data()![AppStrings.userModelId],
  //         photo: _res.data()![AppStrings.userModelPhoto],
  //         name: _res.data()![AppStrings.userModelName],
  //         surname: _res.data()![AppStrings.userModelSurname],
  //         city: _res.data()![AppStrings.userModelCity],
  //         email: _res.data()![AppStrings.userModelEmail],
  //         phoneNumber: _res.data()![AppStrings.userModelPhoneNumber],
  //         aboutYourself: _res.data()![AppStrings.userModelAboutYourself],
  //       );
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return user;
  // }

  Future<void> initColor(Brightness? brightness, Color? scaffoldBackgroundColor) async {
    bgColor!(brightness == AppColors.brightnessDark ? AppColors.colorMediumGray : AppColors.colorWhite);
    await futureDelayed(400);
    bgColor!(scaffoldBackgroundColor);
  }

  void navToLogin() => Get.offAllNamed(AppRoutes.login);
  void navToMain() => Get.offAllNamed(AppRoutes.main);//pageIndex: 0
}