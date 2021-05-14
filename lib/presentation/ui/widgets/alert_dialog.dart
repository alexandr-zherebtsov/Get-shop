part of widgets;

Future<dynamic> showAlert(String headline, String title, void Function()? function, {isLogOut = false}) {
  return Get.dialog(
    AlertDialog(
      title: Text(headline, style: Get.theme.textTheme.headline4),
      content: Text(title),
      actions: [
        TextButton(
          style: textButtonStyle(),
          child: Text(AppLocalization.textCancel, style: Get.theme.textTheme.bodyText1),
          onPressed: () => Get.back(),
        ),
        TextButton(
          style: textButtonStyle(),
          child: Text(
            isLogOut ? AppLocalization.textYes : AppLocalization.textDelete,
            style: Get.theme.textTheme.bodyText1!.copyWith(color: AppColors.colorRed),
          ),
          onPressed: function,
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
