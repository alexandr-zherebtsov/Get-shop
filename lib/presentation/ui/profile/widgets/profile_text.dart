import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget profileText(String title, String text, ResponsiveScreen screen) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: Get.theme.textTheme.headline3),
      Padding(
        padding: screen.isTablet || screen.isDesktop
            ? const EdgeInsets.only(top: 20.0, bottom: 35.0)
            : const EdgeInsets.only(top: 10.0, bottom: 25.0),
        child: Text(text, style: Get.theme.textTheme.headline3),
      ),
    ],
  );
}
