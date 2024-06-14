import 'package:dartz/dartz.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/utils/failure.dart';
import '../usecases/login_usecase.dart';
import '../usecases/register_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register(SaloonRegistrationParams params);
  Future<Either<Failure, User>> login(LoginParams params);
  Future<Either<Failure, bool>> logout();
}
