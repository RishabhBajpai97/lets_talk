import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/core/cubits/user/app_user_cubit.dart';
import 'package:lets_talk/core/usecase/usecase.dart';
import 'package:lets_talk/features/auth/domain/entities/user.dart';
import 'package:lets_talk/features/auth/domain/usecase/GetCurrentUser.dart';
import 'package:lets_talk/features/auth/domain/usecase/UserLogin.dart';
import 'package:lets_talk/features/auth/domain/usecase/UserSignup.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final Usersignup _usersignup;
  final Userlogin _userlogin;
  final GetCurrentUser _getCurrentUser;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required Usersignup usersignup,
    required Userlogin userlogin,
    required GetCurrentUser getCurrentUser,
    required AppUserCubit appUserCubit,
  })  : _usersignup = usersignup,
        _userlogin = userlogin,
        _getCurrentUser = getCurrentUser,
        _appUserCubit = appUserCubit,
        super(AuthBlocInitial()) {
    on<AuthBlocEvent>((AuthBlocEvent event, Emitter<AuthBlocState> emit) {
      emit(AuthLoading());
    });
    on<AuthSignup>((event, Emitter<AuthBlocState> emit) async {
      final response = await _usersignup(SignupParams(
          username: event.username,
          password: event.password,
          email: event.email));
      response.fold((l) {
        emit(AuthFailure(message: l.message));
      }, (user) {
        emit(
          AuthSignupSuccess(
            message: "User Account created successfully",
          ),
        );
      });
    });
    on<AuthLogin>((event, Emitter<AuthBlocState> emit) async {
      final response = await _userlogin(
        LoginParams(
          username: event.username,
          password: event.password,
        ),
      );
      response.fold((l) {
        emit(AuthFailure(message: l.message));
      }, (user) {
        _appUserCubit.updateUser(user);
        emit(
          AuthLoginSuccess(),
        );
      });
    });
    on<GetCurrentUserEvent>(
      (event, emit) async {
        final re = await _getCurrentUser(NoParams());
        re.fold((l) {
          print(l.message);
        }, (user) {
          _appUserCubit.updateUser(user);
          print("object");
          print(user);
        });
      },
    );
  }
}
