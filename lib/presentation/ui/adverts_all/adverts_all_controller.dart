part of adverts_all;

class AdvertsAllController extends GetxController {
  final AdvertsRepository _advertsRepository = Get.find();
  final TextEditingController searchTextController = TextEditingController();
  final JsonDecoder _decoder = JsonDecoder();
  RxBool isLoading = false.obs;
  String currentUserUid = '';
  List<AdvertModel> adverts = [];
  List<AdvertModel> advertsSearched = [];

  @override
  Future<void> onInit() async {
    isLoading(true);
    await getAdverts();
    isLoading(false);
    super.onInit();
  }

  Future<void> getAdverts() async {
    currentUserUid = FirebaseAuth.instance.currentUser!.uid;
    try {
      adverts = await _advertsRepository.getAdverts();
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }
}

