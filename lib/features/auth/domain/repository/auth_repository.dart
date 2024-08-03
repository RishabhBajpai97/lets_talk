import 'package:fpdart/fpdart.dart';
import 'package:lets_talk/core/error/failure.dart';
import 'package:lets_talk/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signup(
      {required email, required password, required username});
  Future<Either<Failure, User>> login({
    required password,
    required username,
  });
}
