import 'package:picsum_gallery/helper/data/model/response/banner_response.dart';
import 'package:picsum_gallery/helper/network/apiprovider/image_api_provider.dart';

class ImageRepository {
  final ImageApiProvider _apiProvider;

  ImageRepository(this._apiProvider);

  Future<ImageResponse> imageList(int pageNo) async {
    return await _apiProvider.imageList(pageNo);
  }
}
