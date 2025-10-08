import 'package:get_it/get_it.dart';

import 'package:fiap_farms/domain/repositories/auth_repository.dart';

import 'package:fiap_farms/domain/use_cases/auth/create_credential_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/logout_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/login_usecase.dart';

void setupDomainModule(GetIt sl) {
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => CreateCredentialUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));
}
