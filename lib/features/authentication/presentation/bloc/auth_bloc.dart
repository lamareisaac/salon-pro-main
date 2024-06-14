import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/utils/failure.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  RegisterUsecase registerUsecase;
  LoginUsecase loginUsecase;
  LogoutUsecase logoutUsecase;

  AuthBloc({
    required this.registerUsecase,
    required this.loginUsecase,
    required this.logoutUsecase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<RegisterEmailChanged>((event, emit) {
      // debugPrint(event.toString());
    });

    on<RegisterSubmited>(_onRegistrationSubmitted);
    on<LoginSubmited>(_onLoginSubmited);
    on<Logout>(_onLogout);
  }

  Future<void> _onRegistrationSubmitted(
      RegisterSubmited event, Emitter<AuthState> emit) async {
    emit(AuthSignupInProgress());
    var response = await registerUsecase(event.params);
    response.fold((l) {
      emit(AuthFailed(failure: l));
    }, (r) {
      emit(AuthComplete(user: r));
    });
  }

  Future<void> _onLoginSubmited(
      LoginSubmited event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    var response = await loginUsecase(event.params);
    response.fold((l) {
      emit(AuthFailed(failure: l));
    }, (r) {
      emit(AuthComplete(user: r));
    });
  }

  Future<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    var response = await logoutUsecase();
    response.fold((l) {
      emit(AuthFailed(failure: l));
    }, (r) {
      emit(LogoutComplete(success: r));
    });
  }
}
