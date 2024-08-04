part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

final class AuthLoading extends AuthBlocState{}

final class AuthSignupSuccess extends AuthBlocState {
  final String message;
  AuthSignupSuccess({required this.message});
}
final class AuthLoginSuccess extends AuthBlocState {
  AuthLoginSuccess();
}
final class AuthFailure extends AuthBlocState {
  final String message;
  AuthFailure({required this.message});
}

final class CurrentUserDataSuccess extends AuthBlocState{
  final User user;
  CurrentUserDataSuccess({required this.user});
}
