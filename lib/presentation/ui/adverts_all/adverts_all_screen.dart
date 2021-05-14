part of adverts_all;

class AdvertsAllScreen extends GetResponsiveView<AdvertsAllController> {
  @override
  Widget builder() => Obx(() => Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.textAllAdverts, style: Get.theme.textTheme.headline2),
      ),
      body: controller.isLoading.value ? progressScreen() : controller.adverts.isEmpty ?
        exceptionScreen(
          title: AppLocalization.textNoAdverts,
          img: AssetsPath.imgGuitarVector,
          isError: false,
          screen: screen,
        ) : controller.advertsSearched.isEmpty && controller.searchTextController.text.isNotEmpty ? exceptionScreen(
          title: AppLocalization.textNoResults,
          img: AssetsPath.imgGuitarVector,
          isError: false,
          screen: screen,
        ) :
        controller.searchTextController.text.isEmpty ? ScrollConfiguration(
          behavior: Behavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: screen.isTablet || screen.isDesktop ?
              const EdgeInsets.symmetric(horizontal: 10.0) : const EdgeInsets.symmetric(horizontal: 3.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 90),
                child: Wrap(
                  children: controller.adverts.map((e) => AdvertItem(e: e, uid: controller.currentUserUid)).toList(),
                ),
              ),
            ),
          ),
        ) : ScrollConfiguration(
          behavior: Behavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: screen.isTablet || screen.isDesktop ?
              const EdgeInsets.symmetric(horizontal: 10.0) : const EdgeInsets.symmetric(horizontal: 3.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 90),
                child: Wrap(
                  children: controller.advertsSearched.map((e) => AdvertItem(e: e, uid: controller.currentUserUid)).toList(),
                ),
              ),
            ),
        ),
      ),
    ),
  );
}