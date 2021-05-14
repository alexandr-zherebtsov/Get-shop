part of widgets;

Widget mainButton(String title, void Function()? onPressed) {
  return MaterialButton(
    elevation: 0.5,
    focusElevation: 0.8,
    highlightElevation: 0.8,
    disabledElevation: 0.5,
    clipBehavior: Clip.hardEdge,
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
    minWidth: 176,
    colorBrightness: AppColors.brightnessDark,
    color: Get.theme.buttonColor,
    child: Text(title, style: Get.theme.textTheme.button),
    onPressed: onPressed,
  );
}
