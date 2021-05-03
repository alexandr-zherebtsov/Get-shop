import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/common/localization.dart';
import 'package:get_shop/core/utils/formatters.dart';
import 'package:get_shop/presentation/ui/profile/profile_controller.dart';
import 'package:get_shop/presentation/ui/profile/widgets/profile_icon.dart';
import 'package:get_shop/presentation/ui/profile/widgets/profile_text.dart';
import 'package:get_shop/presentation/ui/widgets/alert_dialog.dart';
import 'package:get_shop/presentation/ui/widgets/behavior.dart';
import 'package:get_shop/presentation/ui/widgets/headline.dart';
import 'package:get_shop/presentation/ui/widgets/main_button.dart';
import 'package:get_shop/presentation/ui/widgets/progress_screen.dart';

class ProfileScreen extends GetResponsiveView<ProfileController> {
  final String uid;
  ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget builder() {
    controller.initUser(uid);
    return Obx(() => controller.isLoading.value ? progressScreen() : Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: controller.currentUserUid == uid ? null : IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => controller.navBack(),
            tooltip: AppLocalization.textBack,
          ),
          title: Text(
            controller.currentUserUid == uid ? AppLocalization.textYourProfile : AppLocalization.textProfile,
            style: Get.theme.textTheme.headline2,
          ),
          // actions: controller.currentUserUid == uid ? <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.edit),
          //     onPressed: () => controller.toProfileEditing(user: model.user),
          //     tooltip: AppLocalization.textEditProfile,
          //   ),
          // ] : null,
        ),
        body: ScrollConfiguration(
          behavior: Behavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: screen.isPhone && Get.size.width > Get.size.height ?
              const EdgeInsets.symmetric(horizontal: 26, vertical: 10) : screen.isTablet || screen.isDesktop ?
              const EdgeInsets.all(40) : const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      controller.currentUserUid == uid ? InkWell(
                        focusColor: AppColors.colorTransparent,
                        hoverColor: AppColors.colorTransparent,
                        splashColor: AppColors.colorTransparent,
                        highlightColor: AppColors.colorTransparent,
                        onTap: () => print('img'),//model.buildBottomSheet(context, model.user),
                        child: SizedBox(
                          height: screen.isTablet || screen.isDesktop ? 300 : 128,
                          width: screen.isTablet || screen.isDesktop ? 300 : 128,
                          child: Stack(
                            children: [
                              profileIcon(screen, controller.user.photo!),
                              Positioned(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: screen.isTablet || screen.isDesktop ? 60 : 30,
                                    height: screen.isTablet || screen.isDesktop ? 60 : 30,
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: screen.isTablet || screen.isDesktop ? 60 : 30,
                                        color: Get.theme.iconTheme.color,
                                      ),
                                    ),
                                    decoration: const BoxDecoration(
                                      color: AppColors.colorLightGreen,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) : SizedBox(
                        height: screen.isTablet || screen.isDesktop ? 300 : 128,
                        width: screen.isTablet || screen.isDesktop ? 300 : 128,
                        child: profileIcon(screen, controller.user.photo!),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        height: screen.isTablet || screen.isDesktop ? 280 : 128,
                        width: screen.isPhone && Get.size.width > Get.size.height ?
                        Get.size.width - 195 :
                        screen.isTablet || screen.isDesktop ?
                        Get.size.width - 395 : Get.size.width - 167,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.user.name!.isEmpty && controller.user.surname!.isEmpty ? const Offstage() :
                            headline(
                              controller.user.name! + ' ' + controller.user.surname!,
                              screen.isTablet || screen.isDesktop ?
                              Get.theme.textTheme.headline1!.copyWith(fontSize: 44) : Get.theme.textTheme.headline1,
                            ),
                            controller.user.city!.isEmpty ? const Offstage() : headline(
                              controller.user.city!,
                              screen.isTablet || screen.isDesktop ?
                              Get.theme.textTheme.headline3!.copyWith(fontSize: 32) : Get.theme.textTheme.headline3,
                            ),
                            const Offstage(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screen.isTablet || screen.isDesktop ? 30 : 15,
                  ),
                  controller.user.email!.isEmpty ? const Offstage() : profileText(AppLocalization.textEmail + AppLocalization.markColon, controller.user.email!, screen),
                  controller.user.phoneNumber!.isEmpty ? const Offstage() : profileText(AppLocalization.textPhoneNumber + AppLocalization.markColon, formatMaskedPhone(controller.user.phoneNumber!), screen),
                  controller.user.aboutYourself!.isEmpty ? const Offstage() : profileText(controller.currentUserUid == uid ? AppLocalization.textAboutYourself : AppLocalization.textAboutPerson + AppLocalization.markColon, controller.user.aboutYourself!, screen),
                  controller.currentUserUid == uid ? InkWell(
                    focusColor: AppColors.colorTransparent,
                    hoverColor: AppColors.colorTransparent,
                    splashColor: AppColors.colorTransparent,
                    highlightColor: AppColors.colorTransparent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Get.theme.brightness == Brightness.light ? AppColors.colorLightGreen :
                            AppColors.colorWhite.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Get.theme.brightness == Brightness.light ? Icons.brightness_2 :
                            Icons.wb_sunny,
                            size: 24,
                            color: Get.theme.iconTheme.color,
                          ),
                        ),
                        Text(AppLocalization.textChangeTheme, style: Get.theme.textTheme.headline3),
                      ],
                    ),
                    onTap: () => print('change'),//getThemeManager(context).selectThemeAtIndex(Get.theme.brightness == Brightness.light ? 0 : 1),
                  ) : const Offstage(),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 26.0),
                    child: Center(
                      child: mainButton(
                        controller.currentUserUid == uid ? AppLocalization.textLogOut : AppLocalization.textCall,
                        controller.currentUserUid == uid ? () =>
                            showAlert(
                              AppLocalization.textLogOut + AppLocalization.markQuestion,
                              AppLocalization.textLogOutMessage + AppLocalization.markQuestion,
                                  () => controller.logOut(),
                              isLogOut: true,
                            ) : () => controller.callFunc(controller.user.phoneNumber!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
