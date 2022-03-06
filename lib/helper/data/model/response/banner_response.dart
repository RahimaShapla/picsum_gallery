import 'package:picsum_gallery/helper/constant/app_json.dart';

class ImageResponse {
  List<ImageModel>? _imageList;

  ImageResponse();

  ImageResponse.fromJson(List<dynamic>? json) {

    if (json != null) {
      _imageList = [];
      _imageList =  json.map((job) => ImageModel.fromJson(job)).toList();
    }
  }

  List<ImageModel>? get imageList => _imageList;
}

class ImageModel {
  String? _id;
  String? _author;
  int? _width;
  int? _height;
  String? _imageURL;
  String? _downloadURL;

  ImageModel();

  ImageModel.fromJson(Map<String, dynamic>? json) {
    _id = json![id_];
    _author = json[author_];
    _width = json[width_];
    _height = json[height_];
    _imageURL = json[imageUrl_];
    _downloadURL = json[downloadUrl_];
  }

  String? get downloadURL => _downloadURL;

  String? get imageURL => _imageURL;

  int? get height => _height;

  int? get width => _width;

  String? get author => _author;

  String? get id => _id;


}
