import 'package:get_it/get_it.dart';

import 'package:fiap_farms/data/sources/production_service.dart';
import 'package:fiap_farms/data/sources/product_service.dart';
import 'package:fiap_farms/data/sources/auth_service.dart';
import 'package:fiap_farms/data/sources/user_service.dart';
import 'package:fiap_farms/data/sources/harvest_service.dart';
import 'package:fiap_farms/data/sources/stock_batch_service.dart';
import 'package:fiap_farms/data/sources/sale_service.dart';
import 'package:fiap_farms/data/sources/goal_service.dart';

import 'package:fiap_farms/data/repositories/production_repository.dart';
import 'package:fiap_farms/data/repositories/product_repository.dart';
import 'package:fiap_farms/data/repositories/auth_repository.dart';
import 'package:fiap_farms/data/repositories/harvest_repository.dart';
import 'package:fiap_farms/data/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/data/repositories/sale_repository.dart';
import 'package:fiap_farms/data/repositories/goal_repository.dart';

import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/repositories/product_repository.dart';
import 'package:fiap_farms/domain/repositories/auth_repository.dart';
import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/repositories/sale_repository.dart';
import 'package:fiap_farms/domain/repositories/goal_repository.dart';

void setupDataModule(GetIt sl) {
  // Services
  sl.registerLazySingleton<AuthService>(AuthServiceImpl.new);
  sl.registerLazySingleton<UserService>(UserServiceImpl.new);
  sl.registerLazySingleton<ProductService>(ProductServiceImpl.new);
  sl.registerLazySingleton<ProductionService>(ProductionServiceImpl.new);
  sl.registerLazySingleton<HarvestService>(HarvestServiceImpl.new);
  sl.registerLazySingleton<StockBatchService>(StockBatchServiceImpl.new);
  sl.registerLazySingleton<SaleService>(SaleServiceImpl.new);
  sl.registerLazySingleton<GoalService>(GoalServiceImpl.new);

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthService>(), sl<UserService>()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl<ProductService>()),
  );
  sl.registerLazySingleton<ProductionRepository>(
    () => ProductionRepositoryImpl(sl<ProductionService>()),
  );
  sl.registerLazySingleton<HarvestRepository>(
    () => HarvestRepositoryImpl(sl<HarvestService>()),
  );
  sl.registerLazySingleton<StockBatchRepository>(
    () => StockBatchRepositoryImpl(sl<StockBatchService>()),
  );
  sl.registerLazySingleton<SaleRepository>(
    () => SaleRepositoryImpl(sl<SaleService>()),
  );
  sl.registerLazySingleton<GoalRepository>(
    () => GoalRepositoryImpl(sl<GoalService>()),
  );
}
