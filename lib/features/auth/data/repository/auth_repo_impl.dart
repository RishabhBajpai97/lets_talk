import 'package:dio/dio.dart';
import 'package:lets_talk/features/auth/domain/repository/auth_repository.dart';

class AuthRepoImpl implements AuthRepository {
  final Dio _dio;
  AuthRepoImpl({required Dio dio}) : _dio = dio;
  @override
  Future<String> testing() async {
    final response = await _dio.get("/");
    return response.data["message"];
  }
}
