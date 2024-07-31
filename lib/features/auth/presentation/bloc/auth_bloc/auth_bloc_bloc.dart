import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/features/auth/domain/repository/auth_repository.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState>{
  AuthRepository _authRepository;
  AuthBloc({required AuthRepository authRepo}):_authRepository=authRepo, super(AuthBlocInitial()){
    on<AuthBlocEvent>((AuthBlocEvent event,Emitter<AuthBlocState> emit){});
    on<AuthLogin>((event, Emitter<AuthBlocState>emit)async{
        final response = await _authRepository.testing();
        emit(AuthLoginSuccess(message: response));
    });
  }

}