import 'package:picsum_gallery/helper/network/apiprovider/image_api_provider.dart';
import 'package:picsum_gallery/helper/network/repository/home_image_repository.dart';

import 'application.dart';

class PGallery implements Application {
  ImageRepository? imageRepository;

  @override
  Future<void> onCreate() async {
    initRepository();
  }

  @override
  Future<void> onTerminate() async {
    //  _db!.dbClose();
  }

  ///this method initialize API provider
  void initRepository() async {
    ImageApiProvider _apiProvider = ImageApiProvider();
    imageRepository = ImageRepository(_apiProvider);
  }
}
