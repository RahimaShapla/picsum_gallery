

class BannerResponse {
  bool? success;
  String? message;
  String? siteURL;
  int? periodIn;
  List<BannerModel>? bannerList;

  BannerResponse();

  BannerResponse.fromJson(Map<String, dynamic>? json) {
  /*  success = json![status];
    message = json[j_message];
    siteURL = json[siteUrl];
    periodIn = json[period_in];
    if (json[data_] != null) {
      bannerList = [];
      json[data_].forEach((v) {
        bannerList!.add(BannerModel.fromJson(v));
      });
    }*/
  }

 /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[status] = this.success;
    data[j_message] = this.message;
    return data;
  }*/
}

class BannerModel {
  int? id;
  String? enTitle;
  String? bnTitle;
  String? imageUrl;

  BannerModel();

  BannerModel.fromJson(Map<String, dynamic>? json) {
/*    id = json![id_];
    enTitle = json[en_title];
    enTitle = json[bn_title];
    imageUrl = json[image_url];*/
  }
}
