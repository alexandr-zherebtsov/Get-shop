import 'package:flutter/material.dart';
import 'package:get_shop/common/colors.dart';

class AppThemeData {
  static final ThemeData darkTheme = ThemeData(
    brightness: AppColors.brightnessDark,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.colorBlackGray,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColors.colorVeryLightGreen.withOpacity(0.5),
      selectionHandleColor: AppColors.colorVeryLightGreen,
    ),
    textTheme: TextTheme(
      button: const TextStyle(color: AppColors.colorWhite, fontSize: 18),
      headline4: const TextStyle(color: AppColors.colorWhite),
      headline3: const TextStyle(color: AppColors.colorWhite, fontSize: 18, fontWeight: FontWeight.w400),
      headline2: const TextStyle(color: AppColors.colorWhite, fontSize: 22, fontWeight: FontWeight.w400),
      headline1: const TextStyle(
          color: AppColors.colorWhite, fontSize: 24, fontWeight: FontWeight.w400),
      bodyText1: const TextStyle(color: AppColors.colorWhite, fontSize: 16, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(color: AppColors.colorWhite.withOpacity(0.6), fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      brightness: AppColors.brightnessDark,
      color: AppColors.colorBlackGray,
      iconTheme: const IconThemeData(
        color: AppColors.colorWhite,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.colorGray_3,
      shadowColor: AppColors.colorBlack,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(top: 8.0, right: 10.0, left: 10.0),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.colorLightGreen,
      foregroundColor: AppColors.colorWhite.withOpacity(0.3),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.colorWhite,
    ),
    buttonColor: AppColors.colorLightGreen,
    accentColor: AppColors.colorLightGreen,
    primaryColor: AppColors.colorBlackGray,
    scaffoldBackgroundColor: AppColors.colorMediumGray,
    cardColor: AppColors.colorGray_3,
    dividerColor: AppColors.colorWhite,
  );
}
