import 'package:picsum_gallery/helper/constant/app_json.dart';

class BaseResponse{
  bool? success;
  String? message;

  BaseResponse();

  BaseResponse.fromJson(Map<String, dynamic>? json) {
    success = json![status];
    message = json[j_message];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[status] = this.success;
    data[j_message] = this.message;
    return data;
  }
}