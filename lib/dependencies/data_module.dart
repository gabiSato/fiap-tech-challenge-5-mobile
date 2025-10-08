import 'package:get_it/get_it.dart';

import 'package:fiap_farms/data/sources/production_service.dart';
import 'package:fiap_farms/data/sources/product_service.dart';
import 'package:fiap_farms/data/sources/auth_service.dart';
import 'package:fiap_farms/data/sources/user_service.dart';

import 'package:fiap_farms/data/repositories/production_repository.dart';
import 'package:fiap_farms/data/repositories/product_repository.dart';
import 'package:fiap_farms/data/repositories/auth_repository.dart';

import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/repositories/product_repository.dart';
import 'package:fiap_farms/domain/repositories/auth_repository.dart';

void setupDataModule(GetIt sl) {
  sl.registerLazySingleton<AuthService>(AuthServiceImpl.new);
  sl.registerLazySingleton<UserService>(UserServiceImpl.new);
  sl.registerLazySingleton<ProductService>(ProductServiceImpl.new);
  sl.registerLazySingleton<ProductionService>(ProductionServiceImpl.new);

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthService>(), sl<UserService>()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl<ProductService>()),
  );
  sl.registerLazySingleton<ProductionRepository>(
    () => ProductionRepositoryImpl(sl<ProductionService>()),
  );
}
