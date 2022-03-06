
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';

class ApiBaseHelper {
  
  static const String _baseUrl = modeDevelopment == true
      ? 'https://picsum.photos/v2/'
      : 'https://picsum.photos/v2/';

  static const String _contentType = 'Content-Type';


  static const String _xAuthorization = 'X-Authorization';

  static const String _xAuthorizationKeyAndroidApp = modeDevelopment == true
      ? ''
      : '';

  static const String _xAuthorizationKeyIosApp = modeDevelopment == true
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
      ..interceptors.add(DioCacheManager(CacheConfig(baseUrl: "http://www.google.com")).interceptor);
    //  ..interceptors.add(LoggingInterceptors());
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
