import 'package:fpdart/fpdart.dart';
import 'package:lets_talk/core/error/failure.dart';
import 'package:lets_talk/core/usecase/usecase.dart';
import 'package:lets_talk/features/auth/domain/entities/user.dart';
import 'package:lets_talk/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUser implements Usecase<dynamic, NoParams> {
  AuthRepository _authRepository;
  GetCurrentUser({required AuthRepository authRepo}) : _authRepository = authRepo;
  @override
  Future<Either<Failure, User?>> call(NoParams params) async {
    return await _authRepository.getCurrentUser();
  }
}