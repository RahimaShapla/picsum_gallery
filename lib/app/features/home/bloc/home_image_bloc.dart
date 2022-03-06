import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:picsum_gallery/helper/data/model/response/banner_response.dart';
import 'package:picsum_gallery/helper/framework/pgallery_application.dart';
import 'package:picsum_gallery/helper/network/api_response.dart';
import 'package:picsum_gallery/helper/utility/view_util.dart';
import 'package:rxdart/rxdart.dart';

class HomeImageBloc {
  PGallery? _pGallery;

  final BehaviorSubject<ApiResponse<ImageResponse>> _subject =
      BehaviorSubject<ApiResponse<ImageResponse>>();

  HomeImageBloc() {
    _pGallery = PGallery();
    _pGallery!.initRepository();
  }

  ///This method help to interact with network call and UI.
  ///First it check for internet connection then connect with the repository
  ///after getting the response it add data to observer.
  ///[context] as BuildContext, [page] as page number for pagination
  getImageList(context, int page) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      if (page == 1) {
        Utility.instance.innerLoader(context);
      }
      _subject.sink.add(ApiResponse.loading("Wait......"));
      try {
        ImageResponse? response;
        response = await _pGallery!.imageRepository!.imageList(page);
        if (page == 1) {
          Navigator.of(context).pop();
        }
        _subject.sink.add(ApiResponse.completed(response));
      } on Exception catch (e) {
        _subject.sink.add(ApiResponse.error(e.toString()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No internet"),
      ));
    }
  }

  BehaviorSubject<ApiResponse<ImageResponse>> get subject => _subject;

  void dispose() {
    _subject.close();
  }
}
