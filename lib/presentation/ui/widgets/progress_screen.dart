import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget progressScreen() {
  return Container(
    color: Get.theme.scaffoldBackgroundColor,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
