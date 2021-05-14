part of main;

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