import 'package:dartz/dartz.dart';
import 'package:saloon_pro/features/authentication/domain/usecases/register_usecase.dart';
import '../../../../core/entities/user.dart';
import '../../../../core/utils/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(LoginParams params) async {
    try {
      User user = await remoteDataSource.login(params);
      return Right(user);
    } on ValidationException catch (err) {
      return Left(err);
    } on ServerException catch (err) {
      return Left(err);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      SaloonRegistrationParams params) async {
    try {
      User user = await remoteDataSource.register(params);
      // Save user to preferences
      return Right(user);
    } on ValidationException catch (err) {
      print('ValidationException');
      return Left(err);
    } on ServerException catch (err) {
      print('ServerException');
      return Left(err);
    } catch (err) {
      print('default catch');
      print(err.toString());
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(true);
    } on ValidationException catch (err) {
      return Left(err);
    } on ServerException catch (err) {
      return Left(err);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }
}
