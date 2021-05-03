import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/colors.dart';

ButtonStyle textButtonStyle({bool isWhite = false}) {
  return ButtonStyle(
    overlayColor: MaterialStateColor.resolveWith(
       (states) => isWhite ? AppColors.colorWhite.withOpacity(0.1) : Get.theme.dividerColor.withOpacity(0.1),
    ),
  );
}
