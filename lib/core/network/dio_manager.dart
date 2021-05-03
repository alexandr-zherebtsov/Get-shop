import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_shop/core/network/exception_handler.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


/// Class that makes API call easier
class DioManager {
  ///Do not change
  static String BASE_URL = "";
  static Dio? _dioInstance;
  static const BAD_REQUEST_ERROR_CODE = 400;
  static const UNAUTHORIZED_ERROR_CODE = 401;
  static const FORBIDDEN_ERROR_CODE = 403;
  static const NOT_FOUND_ERROR_CODE = 404;
  static const INTERNAL_SERVER_ERROR_CODE = 500;
  static const SERVER_DO_NOT_WORK = 503;

  // Temporary token which used for sms validation
  String? temporaryToken;

  Dio? get dio {
    if (_dioInstance == null) {
      _dioInstance = _initDio();
    }
    return _dioInstance;
  }

  Dio _initDio() {
    String baseUrl;
    baseUrl = BASE_URL;
    final dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 20000,
          sendTimeout: 30000,
          receiveTimeout: 60000),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    return dio;
  }

  /// Instance of decoder for decoding API results
  final JsonDecoder _decoder = JsonDecoder();

  /// DIO GET
  /// take [url], concrete route
  Future<Response> get(String url,
          {Map<String, dynamic>? headers, Map<String, dynamic>? json}) async =>
      await dio!
          .get(url, queryParameters: json, options: Options(headers: headers))
          .then((response) => response)
          .catchError((error) {
        handleErrorApp(error, decoder: _decoder);
      });

  /// DIO POST
  /// take [url], concrete route
  Future<Response> post(String url,
          {Map<String, dynamic>? headers,
          body,
          encoding,
          Options? options}) async =>
      await dio!
          .post(url, data: body, options: options ?? Options(headers: headers))
          .then((response) => response)
          .catchError((error) {
        // handleErrorApp(error, _decoder);
        //handleErrorApp(error, decoder: _decoder);
      });


  /// DIO PUT
  /// take [url], concrete route
  Future<Response> put(String url, {body, encoding, Options? options}) async {
    return await dio!.put(url, data: body, options: options).then((response) {
      return response;
    }).catchError((error) {
      handleErrorApp(error, decoder: _decoder);
    });
  }


  /// DIO DELETE
  /// take [url], concrete route
  Future<Response> delete(String url,
          {Map<String, dynamic>? headers, body, encoding}) async =>
      await dio!
          .delete(url, data: body, options: Options(headers: headers))
          .then((response) {
        return response;
      }).catchError((error) {
        handleErrorApp(error, decoder: _decoder);
      });
}
