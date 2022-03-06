import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:picsum_gallery/helper/constant/app_json.dart';
import 'package:picsum_gallery/helper/data/model/response/banner_response.dart';

import '../api_base_helper.dart';

class ImageApiProvider extends ApiBaseHelper {
  static const String _PICSUM_PHOTOS = 'list';

  ///This method help to make http GET request
  /// if success it return image list from network
  Future<ImageResponse> imageList(int page) async {
    try {
      Response response = await getDio().get(_PICSUM_PHOTOS,
          queryParameters: {
            page_: page,
            limit_: "20",
          },
          options: buildCacheOptions(const Duration(days: 7)));
      return ImageResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return ImageResponse();
    }
  }
}
