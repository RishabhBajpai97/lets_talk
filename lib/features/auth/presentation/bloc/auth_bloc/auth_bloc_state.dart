part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

final class AuthLoginSuccess extends AuthBlocState {
  final String message;
  AuthLoginSuccess({required this.message});
}

final class AuthFailure extends AuthBlocState {
  final String message;
  AuthFailure({required this.message});
}
