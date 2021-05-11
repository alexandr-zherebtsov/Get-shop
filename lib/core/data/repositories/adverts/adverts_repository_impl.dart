import 'package:get_shop/core/data/repositories/adverts/adverts_repository.dart';
import 'package:get_shop/core/data/sources/remote/remote_data_source.dart';
import 'package:get_shop/core/models/advert_model.dart';

class AdvertsRepositoryImpl extends AdvertsRepository {
  final RemoteDataSource _remoteDataSource;
  AdvertsRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<AdvertModel>> getAdverts() async {
    return await _remoteDataSource.getAdverts();
  }

  @override
  Future<void> createAdvert(AdvertModel advert) async {
    return await _remoteDataSource.createAdvert(advert);
  }

  @override
  Future<List<AdvertModel>> getMyAdverts(String uid) async {
    return await _remoteDataSource.getMyAdverts(uid);
  }

  @override
  Future<List<AdvertModel>> getMySavedAdverts(String uid) async {
    return await _remoteDataSource.getMySavedAdverts(uid);
  }

  @override
  Future<void> editAdvert(String id, Map<String, dynamic> advert) async {
    return await _remoteDataSource.editAdvert(id, advert);
  }

  @override
  Future<void> toSavedAdvert(String id, Map<String, dynamic> advert) async {
    return await _remoteDataSource.toSavedAdvert(id, advert);
  }

  @override
  Future<void> deleteAdvert(String id) async {
    return await _remoteDataSource.deleteAdvert(id);
  }
}
