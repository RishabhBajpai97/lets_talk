part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class AuthSignup extends AuthBlocEvent {
  final String email;
  final String password;
  final String username;
  AuthSignup({
    required this.email,
    required this.password,
    required this.username,
  });
}
class AuthLogin extends AuthBlocEvent {
  final String password;
  final String username;
  AuthLogin({
    required this.password,
    required this.username,
  });
}