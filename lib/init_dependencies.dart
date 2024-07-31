import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_talk/features/auth/data/repository/auth_repo_impl.dart';
import 'package:lets_talk/features/auth/domain/repository/auth_repository.dart';
import 'package:lets_talk/features/auth/presentation/bloc/auth_bloc/auth_bloc_bloc.dart';

GetIt sl = GetIt.instance;
initDependencies() {
  initDio();
  sl.registerFactory<AuthRepository>(() => AuthRepoImpl(dio: sl<Dio>()));
  sl.registerLazySingleton<AuthBloc>(
      () => AuthBloc(authRepo: sl<AuthRepository>()));
}

void initDio() {
  final option = BaseOptions(baseUrl: "http://localhost:8000");
  final dio = Dio(option);
  sl.registerLazySingleton(() => dio);
}
