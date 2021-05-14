library adverts_all;

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_shop/common/assets_path.dart';
import 'package:get_shop/common/localization.dart';
import 'package:get_shop/core/data/repositories/adverts/adverts_repository.dart';
import 'package:get_shop/core/models/advert_model.dart';
import 'package:get_shop/core/network/exception_handler.dart';
import 'package:get_shop/presentation/ui/advert_item/advert_imports.dart';
import 'package:get_shop/presentation/ui/widgets/widgets_imports.dart';

part 'adverts_all_screen.dart';
part 'adverts_all_controller.dart';
