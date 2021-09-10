part of profile;

class ProfileController extends GetxController {
  final AuthRepository _authRepository = Get.find();
  final UserRepository _userRepository = Get.find();
  final FirebaseAuth _fb = FirebaseAuth.instance;
  RxBool callCheck = false.obs;
  RxBool isLoading = false.obs;
  String currentUserUid = '';
  late UserModel user;

  Future<void> initUser(String uid) async {
    isLoading(true);
    currentUserUid = _fb.currentUser!.uid;
    DocumentSnapshot res = await _userRepository.getUser(uid);
    Map<String, dynamic> data = res.data() as Map<String, dynamic>;
    user = UserModel(
      id: data[AppStrings.userModelId],
      photo: data[AppStrings.userModelPhoto],
      name: data[AppStrings.userModelName],
      surname: data[AppStrings.userModelSurname],
      city: data[AppStrings.userModelCity],
      email: data[AppStrings.userModelEmail],
      phoneNumber: data[AppStrings.userModelPhoneNumber],
      aboutYourself: data[AppStrings.userModelAboutYourself],
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
    await _authRepository.logOut();
    isLoading(false);
    Get.offAllNamed(AppRoutes.splash);
  }

  void navBack() {
    Get.back();
  }
}
