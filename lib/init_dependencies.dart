import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_talk/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:lets_talk/features/auth/data/repository/auth_repo_impl.dart';
import 'package:lets_talk/features/auth/domain/repository/auth_repository.dart';
import 'package:lets_talk/features/auth/domain/usecase/UserSignup.dart';
import 'package:lets_talk/features/auth/presentation/bloc/auth_bloc/auth_bloc_bloc.dart';

GetIt sl = GetIt.instance;
initDependencies() {
  initDio();
  sl.registerFactory<AuthRepository>(
      () => AuthRepoImpl(remoteDatasoure: sl<AuthRemoteDatasource>()));
  sl.registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(dio: sl<Dio>()));
  sl.registerFactory(() => Usersignup(authRepo: sl<AuthRepository>()));
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      usersignup: sl<Usersignup>(),
    ),
  );
}

void initDio() {
  final option = BaseOptions(
    baseUrl: Platform.isIOS
        ? "http://localhost:3000/api/"
        : "http://10.0.0.2:3000/api/",
  );
  final dio = Dio(option);
  sl.registerLazySingleton(() => dio);
}
