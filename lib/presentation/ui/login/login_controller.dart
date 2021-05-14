part of login;

class LoginController extends GetxController {
  final AuthRepository _authRepository = Get.find();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final loginFormKey = GlobalKey<FormState>();
  final JsonDecoder _decoder = JsonDecoder();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onReady() async{
    super.onReady();
  }

  void signInEmailPassword() async {
    try {
      await _authRepository.signInEmailPassword(emailController.text, passwordController.text);
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