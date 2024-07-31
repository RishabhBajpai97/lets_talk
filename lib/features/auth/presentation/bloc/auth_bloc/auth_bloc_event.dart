part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}
class AuthLogin extends AuthBlocEvent{}
