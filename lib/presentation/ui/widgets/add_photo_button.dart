part of widgets;

Widget addPhotoButton(void Function()? onPressed) {
  return Container(
    width: 58,
    height: 58,
    margin: const EdgeInsets.all(4.0),
    child: MaterialButton(
      minWidth: 58,
      height: 58,
      elevation: 0.5,
      focusElevation: 0.8,
      highlightElevation: 0.8,
      disabledElevation: 0.5,
      padding: EdgeInsets.zero,
      colorBrightness: AppColors.brightnessDark,
      color: Get.theme.buttonColor,
      child: Center(
        child: Icon(
          Icons.add,
          size: 50,
          color: Get.theme.iconTheme.color,
        ),
      ),
      onPressed: onPressed,
    ),
  );
}