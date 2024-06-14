import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../repository/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository repository;
  LogoutUsecase({required this.repository});

  Future<Either<Failure, bool>> call() async {
    return await repository.logout();
  }
}
