import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_shop/core/network/dio_manager.dart';
import 'package:get_shop/core/network/exception_manager.dart';

void handleErrorApp(dynamic error, {JsonDecoder? decoder}) async {
  if (error is DioError) {
    // print(error.response.statusCode);
    if (error.error is SocketException)
      Fluttertoast.showToast(msg: "SocketException");
    else if (error.type == DioErrorType.receiveTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.connectTimeout) {
      Fluttertoast.showToast(msg: "Internet connection");
    }
    else if (error.response != null &&
        error.response!.statusCode != null &&
        exceptions.containsKey(error.response!.statusCode)) {
      if (error.response!.statusCode == DioManager.UNAUTHORIZED_ERROR_CODE) {
        Fluttertoast.showToast(msg: 'UNAUTHORIZED_ERROR_CODE');
      }
      if (error.response!.statusCode == DioManager.INTERNAL_SERVER_ERROR_CODE) {
        // var e = ErrorResponse.fromJson(error.response.data);
        Fluttertoast.showToast(msg: error.message);
      }
      if (error.response!.statusCode == DioManager.BAD_REQUEST_ERROR_CODE) {
        if(error.type == DioErrorType.response){
          // var e = ErrorResponse.fromJson(error.response.data);
          Fluttertoast.showToast(msg: error.message);
        }
        // showWebColoredToast("BAD_REQUEST_ERROR_CODE");
      }
      if (error.response!.statusCode == DioManager.SERVER_DO_NOT_WORK) {
        Fluttertoast.showToast(msg: 'SERVER_DO_NOT_WORK');
      }
    }
    else if(error.type == DioErrorType.other){
      Fluttertoast.showToast(msg: 'OTHER');
    }
  }
  // else if(error is FetchingDataException){
  //   showWebColoredToast(error.msg);
  // }
  // else if(error is FormatException){
  //   showWebColoredToast("Не правильный формат!");
  //   print(error.message);
  // }
  // else if(error is BadRequestException){
  //   var e = ErrorResponse.fromJson(json.decode(error.msg));
  //   showWebColoredToast(e.errors.message);
  // }
  else{

    Fluttertoast.showToast(msg: 'Unexpected error');
  }
}


// void handleError(DioError error, {JsonDecoder decoder}) {
//   if (error.error is SocketException)
//     throw error.error;
//   else if (error.type == DioErrorType.RECEIVE_TIMEOUT ||
//       error.type == DioErrorType.SEND_TIMEOUT ||
//       error.type == DioErrorType.CONNECT_TIMEOUT) {
//     throw ConnectionTimeoutException();
//   } else if (error.response != null &&
//       error.response.statusCode != null &&
//       exceptions.containsKey(error.response.statusCode)) {
//     throw exceptions[error.response.statusCode](error.response.data.toString());
//   }
//   else if(error.type == DioErrorType.RESPONSE){
//     throw error.error;
//   }
//   else {
//     throw FetchingDataException();
//   }
// }
