import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/common/localization.dart';
import 'package:get_shop/presentation/ui/main/main_controller.dart';
import 'package:get_shop/presentation/ui/widgets/bottom_bar_icons.dart';

class MainScreen extends GetResponsiveView<MainController> {
  @override
  Widget builder() => Scaffold(
    body: Obx(() => controller.screens.elementAt(controller.count.value)),
    bottomNavigationBar: Obx(() =>
      BottomNavigationBar(
        elevation: 12.0,
        backgroundColor: Get.theme.appBarTheme.color,
        currentIndex: controller.count.value,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.colorWhite,
        unselectedItemColor: AppColors.colorWhite,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => controller.changeCount(index),
        selectedLabelStyle: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 13.0),
        unselectedLabelStyle: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 12.0),
        items: [
          BottomNavigationBarItem(
            icon: unselectedNavBarIcon(Icons.assignment_outlined),
            activeIcon: selectedNavBarIcon(Icons.assignment),
            label: AppLocalization.textAllAdverts,
          ),
          // BottomNavigationBarItem(
          //   icon: unselectedNavBarIcon(Icons.bookmark_border),
          //   activeIcon: selectedNavBarIcon(Icons.bookmark),
          //   label: AppLocalization.textSaved,
          // ),
          // BottomNavigationBarItem(
          //   icon: unselectedNavBarIcon(Icons.assignment_ind_outlined),
          //   activeIcon: selectedNavBarIcon( Icons.assignment_ind),
          //   label: AppLocalization.textMyAdverts,
          // ),
          BottomNavigationBarItem(
            icon: unselectedNavBarIcon(Icons.person_outline),
            activeIcon: selectedNavBarIcon(Icons.person),
            label: AppLocalization.textProfile,
          ),
        ],
      ),
    ),
  );
}