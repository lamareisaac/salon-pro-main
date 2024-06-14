part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSignupInProgress extends AuthState {}

final class AuthFailed extends AuthState {
  Failure failure;
  AuthFailed({required this.failure});
}

final class AuthComplete extends AuthState {
  User user;
  AuthComplete({required this.user});
}

final class LogoutComplete extends AuthState {
  final bool success;
  LogoutComplete({this.success = false});
}
