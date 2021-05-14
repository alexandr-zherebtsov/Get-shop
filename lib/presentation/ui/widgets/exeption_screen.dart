part of widgets;

Widget exceptionScreen({required String title, required String img, required bool isError, required ResponsiveScreen screen}) {
  return Center(
    child: Padding(
      padding: isError ? const EdgeInsets.only(top: 80.0) : const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          headline(
            title,
            Get.theme.textTheme.headline1!.copyWith(
              color: Get.theme.textTheme.headline1!.color!.withOpacity(0.72),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(
                maxWidth: Get.size.width > Get.size.height && screen.isPhone ? 220 : 420,
                maxHeight: Get.size.width > Get.size.height && screen.isPhone ? 220 : 420,
              ),
              child: Image.asset(
                img,
                fit: BoxFit.fitHeight,
                color: Get.theme.textTheme.headline1!.color!.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}