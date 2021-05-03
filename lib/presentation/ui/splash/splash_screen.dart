import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/core/utils/utils.dart';
import 'package:get_shop/presentation/ui/splash/splash_controller.dart';
import 'package:get_shop/presentation/ui/splash/widgets/splash_progress.dart';

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