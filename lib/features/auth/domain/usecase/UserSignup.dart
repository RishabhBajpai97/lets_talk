import 'package:fpdart/fpdart.dart';
import 'package:lets_talk/core/error/failure.dart';
import 'package:lets_talk/core/usecase/usecase.dart';
import 'package:lets_talk/features/auth/domain/entities/user.dart';
import 'package:lets_talk/features/auth/domain/repository/auth_repository.dart';

class Usersignup implements Usecase<dynamic, SignupParams> {
  AuthRepository _authRepository;
  Usersignup({required AuthRepository authRepo}) : _authRepository = authRepo;
  @override
  Future<Either<Failure, User>> call(SignupParams params) async {
    return await _authRepository.signup(
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}

class SignupParams {
  final String username;
  final String email;
  final String password;
  SignupParams(
      {required this.username, this.email = "", required this.password});
}
