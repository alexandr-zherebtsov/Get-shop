import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/common/localization.dart';

Widget priceItem(String title) {
  return Container(
    constraints: BoxConstraints(
      minWidth: 90,
      minHeight: 25,
      maxWidth: 100,
    ),
    decoration: BoxDecoration(
      color: AppColors.colorLightGreen,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: Text(
        title + ' ' + AppLocalization.markDollar,
        style: Get.theme.textTheme.headline3!.copyWith(color: AppColors.colorWhite),
      ),
    ),
  );
}
