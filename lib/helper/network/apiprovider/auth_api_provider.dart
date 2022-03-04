import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../api_base_helper.dart';

class AuthApiProvider extends ApiBaseHelper {
  static const String _REGISTRATION = 'registerr';
  static const String _LOGIN = 'login';
  static const String _OTP_VERIFY = 'verify-otp';
  static const String _LOGOUT = 'logout';
  static const String _PERSONAL_INFO = 'personal-info';
  static const String _UPDATE_PROFILE = 'update-user';
  static const String _UPDATE_PERIOD = 'period-info-check';
  static const String _SEND_OTP = 'send-otp';
  static const String _FORGOT_PASSWORD = 'forgot-password';

 /* Future<AuthResponse> registration(String name, String dob, String phone,
      String email, String password) async {
    try {
      Response response = await getDio().post(_REGISTRATION, queryParameters: {
        'name': name,
        'phone': phone,
        'email': email,
        'birth_date': dob,
        'password': password
      });
      return AuthResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return AuthResponse();
    }
  }

  Future<AuthResponse> otpVerify(String pin, String phone) async {
    try {
      Response response = await getDio().post(_OTP_VERIFY, queryParameters: {
        'otp': pin,
        'phone': phone,
      });
      return AuthResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return AuthResponse();
    }
  }

  Future<LoginResponse> login(String phone, String password) async {
    try {
      Response response = await getDio().post(_LOGIN, queryParameters: {
        'phone': phone,
        'password': password,
      });
      return LoginResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return LoginResponse();
    }
  }

  Future<BaseResponse> logout(String token) async {
    try {
      Response response = await getDio().post(_LOGOUT,
          options: Options(
            headers: {"Authorization": token},
          ));
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponse();
    }
  }

  Future<BaseResponse> updatePeriod(String token) async {
    try {
      Response response = await getDio().get(_UPDATE_PERIOD,
          options: Options(
            headers: {"Authorization": token},
          ));
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponse();
    }
  }

  Future<BaseResponse> personalInfo(
      String token,
      startDate,
      periodDuration,
      isIrregularPeriod,
      cycleDuration,
      height,
      weight,
      endDate,
      irregularMonth) async {
    try {
      Response response = await getDio().post(_PERSONAL_INFO,
          options: Options(
            headers: {"Authorization": token},
          ),
          queryParameters: {
            'period_duration': periodDuration,
            'irregular': isIrregularPeriod,
            'cycle_duration': cycleDuration,
            'irregular_month': irregularMonth,
            'height': height,
            'weight': weight,
            'period_start_date': startDate,
            'period_end_date': endDate,
          });
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponse();
    }
  }

  Future<ProfileResponse> updateProfile(
      String token, name, phone, email, dob, file) async {
    try {
      FormData data = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          file.path,
        ),

        'name': name,
        'phone': phone,
        'email': email,
        'birth_date': dob,
        // 'image': "",
      });
      // Map<String, dynamic> body = ;
      Response response = await getDio().post(_UPDATE_PROFILE,
          data: data,
          *//*  queryParameters: {
            'name': name,
            'phone': phone,
            'email': email,
            'birth_date': dob,
            "image": await MultipartFile.fromFile(file.path),
          },*//*
          options: Options(
            headers: {
              "Authorization": token,
            },
          ));

      return ProfileResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return ProfileResponse();
    }
  }

  Future<BaseResponse> sendOtp(String phone) async {
    try {
      Response response =
          await getDio().post(_SEND_OTP, queryParameters: {"phone": phone});
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponse();
    }
  }

  Future<BaseResponse> resetPassword(
      String phone, password, confirmPassword) async {
    try {
      Response response = await getDio().post(_FORGOT_PASSWORD,
          queryParameters: {
            "phone": phone,
            "password": password,
            "password_confirmation": confirmPassword
          });
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponse();
    }
  }*/
}
