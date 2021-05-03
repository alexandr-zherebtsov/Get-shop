import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/colors.dart';

Widget profileIcon(ResponsiveScreen screen, String photo) {
  return ClipOval(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Get.theme.brightness == Brightness.light ? AppColors.colorBlack.withOpacity(0.12) : AppColors.colorWhite.withOpacity(0.2),
      ),
      child: photo.isEmpty ? Icon(
        Icons.person,
        size: screen.isTablet || screen.isDesktop ? 210 : 90,
      ) : Image.network(
        photo,
        key: UniqueKey(),
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, _, error) => Icon(
          Icons.error_outline,
          size: screen.isTablet || screen.isDesktop ? 190 : 70,
        ),
      ),
    ),
  );
}