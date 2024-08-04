import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lets_talk/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> signup(
      {required email, required password, required username});
  Future<UserModel> login({required password, required username});
  Future<UserModel?> getCurrentUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio _dio;
  final SharedPreferences _prefs;
  AuthRemoteDatasourceImpl({required dio, required prefs})
      : _dio = dio,
        _prefs = prefs;
  @override
  Future<UserModel> signup(
      {required email, required password, required username}) async {
    try {
      final response = await _dio.post(
        "auth/signup",
        data: json.encode(
          {
            "email": email,
            "password": password,
            "username": username,
          },
        ),
      );
      print(response.data);
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        throw (e.response!.data["message"][0]);
      } else if (e.response!.statusCode == 400) {
        throw (e.response!.data["message"][0]);
      }
      throw (e.toString());
    }
  }

  @override
  Future<UserModel> login({required password, required username}) async {
    try {
      final response = await _dio.post(
        "auth/login",
        data: json.encode(
          {
            "password": password,
            "username": username,
          },
        ),
      );
      await _prefs.setString("token", response.data["access_token"]);
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        throw (e.response!.data["message"][0]);
      } else if (e.response!.statusCode == 400) {
        throw (e.response!.data["message"][0]);
      }
      throw (e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final token = _prefs.getString("token");
      if (token == null) {
        throw ("Error in Getting user token");
      }
      final response = await _dio.get(
        "users/me",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        throw (e.response!.data["message"][0]);
      } else if (e.response!.statusCode == 400) {
        throw (e.response!.data["message"][0]);
      }
      throw (e.response!.data["message"]);
    }
  }
}
