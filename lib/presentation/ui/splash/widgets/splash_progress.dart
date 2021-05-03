import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/assets_path.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/presentation/ui/splash/splash_controller.dart';

class SplashProgress extends StatefulWidget {
  final Brightness? brightness;
  final SplashController? controller;
  SplashProgress({Key? key, this.brightness, this.controller}) : super(key: key);

  @override
  _SplashProgressState createState() => _SplashProgressState();
}

class _SplashProgressState extends State<SplashProgress> with SingleTickerProviderStateMixin {
  late Animation? animation;
  late AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 1300),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn),
    );
    animationController!.forward();
  }

  @override
  dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller!.initColor(widget.brightness, Get.theme.scaffoldBackgroundColor);
    return Obx(() =>
        AnimatedContainer(
        duration: Duration(milliseconds: 1800),
        curve: Curves.fastOutSlowIn,
        color: widget.controller!.bgColor!.value,
        padding: const EdgeInsets.only(top: 16.0),
        child: FadeTransition(
          opacity: animationController!.drive(CurveTween(curve: Curves.fastOutSlowIn)),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: Container(
                    width: Get.size.width < Get.size.height ?
                    Get.size.width - 112 : Get.size.height - 72,
                    height: Get.size.width < Get.size.height ?
                    Get.size.width - 112 : Get.size.height - 72,
                    constraints: BoxConstraints(
                      maxWidth: 508,
                      maxHeight: 508,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.colorVeryLightGreen),
                      strokeWidth: 10,
                    ),
                  ),
                ),
                Container(
                  width: Get.size.width < Get.size.height ?
                  Get.size.width - 120 : Get.size.height - 80,
                  height: Get.size.width < Get.size.height ?
                  Get.size.width - 120 : Get.size.height - 80,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 500,
                  ),
                  child: Image.asset(AssetsPath.imgBigLogo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
