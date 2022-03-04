import 'application.dart';

class PGallery implements Application {
 // AuthRepository? authRepository;

  @override
  Future<void> onCreate() async {
    initAuthRepository();

  }

  @override
  Future<void> onTerminate() async {
  //  _db!.dbClose();
  }


  void initAuthRepository() async {
/*    AuthApiProvider _apiProvider = AuthApiProvider();
    authRepository = AuthRepository(_apiProvider);*/
  }
}
