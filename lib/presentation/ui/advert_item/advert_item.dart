part of advert;

class AdvertItem extends GetResponsiveView<AdvertItemController> {
  final AdvertModel e;
  final String uid;
  AdvertItem({Key? key, required this.e, required this.uid}) : super(key: key);

  @override
  Widget builder() => Container(
    height: 150,
    clipBehavior: Clip.hardEdge,
    margin: const EdgeInsets.all(3.0),
    width: Get.size.width > Get.size.height && screen.isPhone ? Get.size.width / 2 - 9 :
    Get.size.width > Get.size.height && screen.isDesktop || screen.isTablet ?
    Get.size.width / 2 - 16 : double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: AppColors.colorBlack.withOpacity(0.01),
          spreadRadius: 0.0,
          blurRadius: 0.0,
          offset: Offset.zero,
        ),
      ],
    ),
    child: Card(
      margin: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () => print('tap'),//controller.toAdvertView(e),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Stack(
                  children: [
                    Hero(
                      tag: e.id! + AppStrings.heroPhoto,
                      child: Container(
                        height: 140,
                        width: 140,
                        color: AppColors.colorBlack.withOpacity(0.1),
                        child: e.images == null || e.images!.isEmpty ? Image.asset(
                          AssetsPath.imgGuitarVector,
                          fit: BoxFit.fitHeight,
                          color: Get.theme.textTheme.headline1!.color!.withOpacity(0.6),
                        ) : Image.network(
                          e.images![0],
                          key: UniqueKey(),
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CircularProgressIndicator());
                          },
                          fit: BoxFit.cover,
                          errorBuilder: (context, _, error) => Icon(
                            Icons.error_outline,
                            size: 90,
                          ),
                        ),
                      ),
                    ),
                    // uid == e.uid ? Offstage() : InkWell(
                    //   highlightColor: AppColors.colorTransparent,
                    //   splashColor: AppColors.colorTransparent,
                    //   focusColor: AppColors.colorTransparent,
                    //   hoverColor: AppColors.colorTransparent,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(4.0),
                    //     child: DecoratedIcon(
                    //       isSaved ? Icons.bookmark : Icons.bookmark_outline,
                    //       size: 29,
                    //       shadows: [
                    //         BoxShadow(
                    //           blurRadius: 12.0,
                    //           color: AppColors.colorBlack.withOpacity(0.3),
                    //           offset: Offset(0, 2.0),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    //   onTap: () async {
                    //     isSaved = await model.setSave(e, uid, isSaved);
                    //     model.notifyListeners();
                    //   },
                    // ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: e.id! + AppStrings.heroHeadline,
                        child: headline(e.headline!, Get.theme.textTheme.headline1),
                      ),
                      Hero(
                        tag: e.id! + AppStrings.heroDescription,
                        child: Text(
                          e.description!,
                          style: Get.theme.textTheme.bodyText2,
                          softWrap: true,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Hero(
                          tag: e.id! + AppStrings.heroPrice,
                          child: priceItem(e.price.toString()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}