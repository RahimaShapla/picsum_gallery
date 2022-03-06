import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:picsum_gallery/helper/utility/view_util.dart';

class FunctionUtility {
  FunctionUtility._privateConstructor();

  static final FunctionUtility _instance =
      FunctionUtility._privateConstructor();

  static FunctionUtility get instance {
    return _instance;
  }

  ///This method save image from url to download file
  /// [context] , [url] and [id] are @BuildContext, @ImageURl, and @Image id
  /// First you need to seek for write permission then download the image through @Dio library

  saveImage(context, url, id) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if (statuses[Permission.storage]!.isGranted) {
      Utility.instance.innerLoader(context);
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String saveName = "banner" + id + ".png";
        String savePath = dir.path + "/$saveName";
        try {
          await Dio().download(url, savePath,
              onReceiveProgress: (received, total) {
            if (total != -1) {
              // print((received / total * 100).toStringAsFixed(0) + "%");
              //you can build progressbar feature too
            }
          });
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Image is saved to download folder."),
          ));
        } on DioError catch (e) {
          Navigator.pop(context);
          // print(e.message);
        }
      } else {
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
    }
  }

  /// This method help to share image link to social media and other sharable
  /// platform.
  /// [imageLink] is image URL and [author] is teh name of the image's author
  /// its an asynchronous function
  Future<void> share(imageLink, author) async {
    await FlutterShare.share(
        title: author,
        text: 'Check the image',
        linkUrl: imageLink,
        chooserTitle: 'Check the image');
  }
}
