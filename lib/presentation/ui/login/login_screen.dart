import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/common/localization.dart';
import 'package:get_shop/common/reg_exp.dart';
import 'package:get_shop/common/styles.dart';
import 'package:get_shop/presentation/ui/login/login_controller.dart';
import 'package:get_shop/presentation/ui/widgets/behavior.dart';
import 'package:get_shop/presentation/ui/widgets/main_button.dart';

class LoginScreen extends GetResponsiveView<LoginController> {
  @override
  Widget builder() => Scaffold(
    appBar: AppBar(
      leading: null,
      title: Text(AppLocalization.textLogIn, style: Get.theme.textTheme.headline2),
      // actions: <Widget>[
      //   TextButton(
      //     style: textButtonStyle(isWhite: true),
      //     child: Text(
      //       AppLocalization.textRegistration,
      //       style: Get.theme.textTheme.headline3?.copyWith(color: AppColors.colorWhite),
      //     ),
      //     onPressed: () => controller.navToRegister(),
      //   ),
      // ],
    ),
    body: ScrollConfiguration(
      behavior: Behavior(),
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Form(
              key: controller.loginFormKey,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Column(
                    children: [
                      screen.isTablet || screen.isDesktop ?
                      const SizedBox(height: 80) : const Offstage(),
                      TextFormField(
                        controller: controller.emailController,
                        cursorColor: Get.theme.accentColor,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        autofocus: false,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.email),
                          labelText: AppLocalization.textEmail,
                        ),
                        validator: (v) {
                          RegExp regex = RegExp(AppRegExp.emailReg);
                          if (v!.isEmpty) {
                            return AppLocalization.textNotBeEmpty;
                          } else if (!regex.hasMatch(v)) {
                            return AppLocalization.textCheckYourEmail;
                          } else {
                            return null;
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60),
                        child: TextFormField(
                          controller: controller.passwordController,
                          keyboardType: TextInputType.text,
                          cursorColor: Get.theme.accentColor,
                          autocorrect: false,
                          obscureText: true,
                          autofocus: false,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.lock),
                            labelText: AppLocalization.textPassword,
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppLocalization.textNotBeEmpty;
                            } else if (v.length < 4) {
                              return AppLocalization.text4Characters;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      screen.isTablet || screen.isDesktop ?
                      const SizedBox(height: 100) : const Offstage(),
                      mainButton(
                        AppLocalization.textLogIn,
                          () {
                          if (controller.loginFormKey.currentState!.validate()) {
                            controller.signInEmailPassword();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

      ),
    ),
  );
}