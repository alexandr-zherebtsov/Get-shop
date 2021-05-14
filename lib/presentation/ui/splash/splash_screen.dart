part of splash;

class SplashScreen extends GetResponsiveView<SplashController> {
  @override
  Widget builder() {
    final Brightness? brightness = Get.mediaQuery.platformBrightness;
    return FutureBuilder(
        future: futureDelayed(200),
        builder: (c, s) =>
        s.connectionState == ConnectionState.done
            ? SplashProgress(brightness: brightness, controller: controller)
            : Container(
          color: brightness == Brightness.dark ? AppColors.colorMediumGray : AppColors.colorWhite,
        ),
    );
  }
}