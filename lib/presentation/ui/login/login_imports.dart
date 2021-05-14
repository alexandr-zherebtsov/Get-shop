library login;

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_shop/common/colors.dart';
import 'package:get_shop/common/localization.dart';
import 'package:get_shop/common/reg_exp.dart';
import 'package:get_shop/core/data/repositories/auth/auth_repository.dart';
import 'package:get_shop/core/network/exception_handler.dart';
import 'package:get_shop/presentation/router/router_imports.dart';
import 'package:get_shop/presentation/ui/widgets/widgets_imports.dart';

part 'login_screen.dart';
part 'login_controller.dart';
