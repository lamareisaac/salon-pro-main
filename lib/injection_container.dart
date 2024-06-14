import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saloon_pro/core/models/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_service.dart';
import 'features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'features/authentication/data/repository/auth_repository_impl.dart';
import 'features/authentication/domain/repository/auth_repository.dart';
import 'features/authentication/domain/usecases/login_usecase.dart';
import 'features/authentication/domain/usecases/logout_usecase.dart';
import 'features/authentication/domain/usecases/register_usecase.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /// Features
  /// Data sources
  sl.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(network: sl(), preferences: sl()));

  /// Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl()));

  /// Usecases
  sl.registerFactory<RegisterUsecase>(() => RegisterUsecase(repository: sl()));
  sl.registerFactory<LoginUsecase>(() => LoginUsecase(repository: sl()));
  sl.registerFactory<LogoutUsecase>(() => LogoutUsecase(repository: sl()));

  /// Core
  final sharedPref = await SharedPreferences.getInstance();

  // Setup hive
  await Hive.initFlutter();
  Box box = await Hive.openBox('auth');

  sl.registerLazySingleton(() => sharedPref);
  sl.registerFactory(() => box);
  sl.registerFactory<NetworkService>(() => NetworkService(preferences: sl()));

  sl.registerLazySingleton<UserPreferences>(
      () => UserPreferences(sharedPreferences: sl(), authBox: sl()));
}
