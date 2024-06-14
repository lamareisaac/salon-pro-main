import 'package:laravel_exception/laravel_exception.dart';

class Failure extends Error {
  final String message;
  Failure({required this.message});
}

class ServerException extends Failure {
  final dynamic error;
  late int code;
  ServerException({required String message, int code = 200, this.error})
      : super(message: message);
}

class ValidationException extends Failure {
  final Map<String, dynamic> response;
  late LValidationException lexception;
  ValidationException({required message, required this.response})
      : super(message: message) {
    lexception = LValidationException(response);
  }
}

class AuthenticationFailedException extends Failure {
  AuthenticationFailedException(message) : super(message: message);
}
