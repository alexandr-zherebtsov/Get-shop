part of widgets;

Widget unselectedNavBarIcon(IconData icon) {
  return Icon(icon, color: Get.theme.appBarTheme.iconTheme!.color, size: 27.0);
}

Widget selectedNavBarIcon(IconData icon) {
  return Icon(icon, color:Get.theme.appBarTheme.iconTheme!.color, size: 29.0);
}