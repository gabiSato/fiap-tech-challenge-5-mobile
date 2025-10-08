import 'package:get_it/get_it.dart';

import 'package:fiap_farms/data/sources/auth_service.dart';
import 'package:fiap_farms/data/sources/user_service.dart';

import 'package:fiap_farms/domain/repositories/auth_repository.dart';
import 'package:fiap_farms/data/repositories/auth_repository.dart';

void setupDataModule(GetIt sl) {
  sl.registerLazySingleton<AuthService>(AuthServiceImpl.new);
  sl.registerLazySingleton<UserService>(UserServiceImpl.new);

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthService>(), sl<UserService>()),
  );
}
