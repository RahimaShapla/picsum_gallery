
import 'package:picsum_gallery/helper/network/apiprovider/auth_api_provider.dart';

class AuthRepository {
  AuthApiProvider _apiProvider;

  AuthRepository(this._apiProvider);

 /* Future<AuthResponse> registration(String name, String dob, String phone,
      String email, String password) async {
    return await _apiProvider.registration(name, dob, phone, email, password);
  }

  Future<AuthResponse> otpVerify(String otp, String phone) async {
    return await _apiProvider.otpVerify(otp, phone);
  }

  Future<LoginResponse> login(String phone, String password) async {
    return await _apiProvider.login(phone, password);
  }

  Future<BaseResponse> logout(String token) async {
    return await _apiProvider.logout(token);
  }

  Future<BaseResponse> updatePeriod(String token) async {
    return await _apiProvider.updatePeriod(token);
  }*/

}
