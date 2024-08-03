import 'package:fpdart/fpdart.dart';
import 'package:lets_talk/core/error/failure.dart';
import 'package:lets_talk/core/usecase/usecase.dart';
import 'package:lets_talk/features/auth/domain/entities/user.dart';
import 'package:lets_talk/features/auth/domain/repository/auth_repository.dart';

class Userlogin implements Usecase<dynamic, LoginParams> {
  AuthRepository _authRepository;
  Userlogin({required AuthRepository authRepo}) : _authRepository = authRepo;
  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await _authRepository.login(
      password: params.password,
      username: params.username,
    );
  }
}

class LoginParams {
  final String username;
  final String password;
  LoginParams(
      {required this.username, required this.password,});
}
