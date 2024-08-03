import 'package:fpdart/src/either.dart';
import 'package:lets_talk/core/error/failure.dart';
import 'package:lets_talk/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:lets_talk/features/auth/data/models/user_model.dart';
import 'package:lets_talk/features/auth/domain/entities/user.dart';
import 'package:lets_talk/features/auth/domain/repository/auth_repository.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  AuthRepoImpl({required AuthRemoteDatasource remoteDatasoure})
      : _remoteDatasource = remoteDatasoure;
  @override
  Future<Either<Failure, UserModel>> signup(
      {required email, required password, required username}) async {
    try {
      final response = await _remoteDatasource.signup(
          email: email, password: password, username: username);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> login({required password, required username}) async{
    try {
      final response = await _remoteDatasource.login( password: password, username: username);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
