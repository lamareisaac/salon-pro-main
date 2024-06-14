import 'package:dartz/dartz.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/utils/failure.dart';
import '../repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase({required this.repository});

  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params);
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
