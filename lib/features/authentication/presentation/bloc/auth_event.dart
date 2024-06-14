part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class RegisterEmailChanged extends AuthEvent {
  final String email;

  const RegisterEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

final class RegisterCompanyNameChanged extends AuthEvent {
  final String name;

  const RegisterCompanyNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

final class RegisterUserNameChanged extends AuthEvent {
  final String name;

  const RegisterUserNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

final class RegisterSubmited extends AuthEvent {
  final SaloonRegistrationParams params;
  const RegisterSubmited({required this.params});
}

final class LoginSubmited extends AuthEvent {
  final LoginParams params;
  const LoginSubmited({required this.params});
}

final class Logout extends AuthEvent {
  const Logout();
}
