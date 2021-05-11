import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/core/data/repositories/adverts/adverts_repository.dart';
import 'package:get_shop/core/models/advert_model.dart';
import 'package:get_shop/core/network/exception_handler.dart';

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

