import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/features/auth/domain/usecase/UserSignup.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final Usersignup _usersignup;
  AuthBloc({required Usersignup usersignup})
      : _usersignup = usersignup,
        super(AuthBlocInitial()) {
    on<AuthBlocEvent>((AuthBlocEvent event, Emitter<AuthBlocState> emit) {});
    on<AuthSignup>((event, Emitter<AuthBlocState> emit) async {
      final response = await _usersignup(SignupParams(
          username: event.username,
          password: event.password,
          email: event.email));
      response.fold((l) {
        emit(AuthFailure(message: l.message));
      }, (user) {
        emit(
          AuthLoginSuccess(
            message: "User Account created successfully",
          ),
        );
      });
    });
  }
}
