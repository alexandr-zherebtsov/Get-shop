import 'package:get_shop/core/base/base_repository.dart';
import 'package:get_shop/core/models/advert_model.dart';

abstract class AdvertsRepository extends BaseRepository {

  Future<List<AdvertModel>> getAdverts();

  Future<void> createAdvert(AdvertModel createAdvert);

  Future<List<AdvertModel>> getMyAdverts(String uid);

  Future<List<AdvertModel>> getMySavedAdverts(String uid);

  Future<void> editAdvert(String id, Map<String, dynamic> advert);

  Future<void> toSavedAdvert(String id, Map<String, dynamic> advert);

  Future<void> deleteAdvert(String id);

}