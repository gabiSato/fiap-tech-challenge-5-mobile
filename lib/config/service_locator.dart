import 'package:get_it/get_it.dart';

import 'package:fiap_farms/data/sources/auth_service.dart';
import 'package:fiap_farms/data/sources/user_service.dart';

import 'package:fiap_farms/data/repositories/auth_repository.dart';
import 'package:fiap_farms/domain/repositories/auth_repository.dart';

import 'package:fiap_farms/domain/use_cases/auth/login_usecase.dart';

import 'package:fiap_farms/ui/auth/stores/login_store.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  sl.registerLazySingleton<UserService>(() => UserServiceImpl());

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthService>(), sl<UserService>()),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));

  sl.registerFactory(() => LoginStore(sl<LoginUseCase>()));
}
