library profile;

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/common/localization.dart';
import 'package:get_shop/core/utils/formatters.dart';
import 'package:get_shop/presentation/router/router_imports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_shop/common/strings.dart';
import 'package:get_shop/core/data/repositories/auth/auth_repository.dart';
import 'package:get_shop/core/data/repositories/user/user_repository.dart';
import 'package:get_shop/core/models/user_model.dart';
import 'package:get_shop/presentation/ui/widgets/widgets_imports.dart';
import 'package:url_launcher/url_launcher.dart';

part 'profile_screen.dart';
part 'profile_controller.dart';
part 'widgets/profile_icon.dart';
part 'widgets/profile_text.dart';
