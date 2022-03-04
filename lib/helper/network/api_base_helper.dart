
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';


import 'logging_interceptor.dart';

class ApiBaseHelper {
  
  static const String _baseUrl = MODE_DEVELOPMENT == true
      ? 'https://wateraid-bd.digitaluservice.org/api/v1/'
      : 'https://wateraid-bd.digitaluservice.org/api/v1/';

  static const String _contentType = 'Content-Type';


  static const String _xAuthorization = 'X-Authorization';

  static const String _xAuthorizationKeyAndroidApp = MODE_DEVELOPMENT == true
      ? ''
      : '';

  static const String _xAuthorizationKeyIosApp = MODE_DEVELOPMENT == true
      ? ''
      : '';

  static String getXAuthorizationKey = getAppWiseXAuthorizationKey();

  static String getAppWiseXAuthorizationKey() {
    return Platform.isAndroid == true
        ? _xAuthorizationKeyAndroidApp
        : _xAuthorizationKeyIosApp;
  }

  Dio? _dio;

  ApiBaseHelper() {
    BaseOptions dioOptions = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 60000,
      headers: {
        _contentType: 'application/json'
      },
    );

    _dio = Dio(dioOptions)
      ..interceptors.add(LoggingInterceptors());
  }

  Dio getDio() => _dio!;

  String handleError(DioError error) {
    String errorDescription = "";
    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        errorDescription =
        "Received invalid status code: ${error.response!.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        errorDescription =
        "Connection to API server failed due to internet connection";
        break;
    }
    return errorDescription;
  }
}
