part of widgets;

Widget progressScreen() {
  return Container(
    color: Get.theme.scaffoldBackgroundColor,
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.colorLightGreen),
      ),
    ),
  );
}
