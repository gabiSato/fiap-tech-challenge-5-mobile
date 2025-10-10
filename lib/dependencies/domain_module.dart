import 'package:get_it/get_it.dart';

import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/repositories/product_repository.dart';
import 'package:fiap_farms/domain/repositories/auth_repository.dart';
import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/repositories/sale_repository.dart';
import 'package:fiap_farms/domain/repositories/goal_repository.dart';

// Auth
import 'package:fiap_farms/domain/use_cases/auth/login_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/logout_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/create_credential_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';

// Product
import 'package:fiap_farms/domain/use_cases/product/create_product_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/get_product_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/get_products_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/update_product_usecase.dart';

// Production
import 'package:fiap_farms/domain/use_cases/production/create_production_usecase.dart';
import 'package:fiap_farms/domain/use_cases/production/get_productions_usecase.dart';
import 'package:fiap_farms/domain/use_cases/production/get_production_usecase.dart';
import 'package:fiap_farms/domain/use_cases/production/update_production_usecase.dart';
import 'package:fiap_farms/domain/use_cases/production/delete_production_usecase.dart';
import 'package:fiap_farms/domain/use_cases/production/get_productions_by_status_usecase.dart';

// Harvest
import 'package:fiap_farms/domain/use_cases/harvest/create_harvest_usecase.dart';
import 'package:fiap_farms/domain/use_cases/harvest/get_harvests_usecase.dart';
import 'package:fiap_farms/domain/use_cases/harvest/get_harvests_by_production_id_usecase.dart';
import 'package:fiap_farms/domain/use_cases/harvest/get_harvests_by_quality_usecase.dart';
import 'package:fiap_farms/domain/use_cases/harvest/update_harvest_usecase.dart';
import 'package:fiap_farms/domain/use_cases/harvest/delete_harvest_usecase.dart';

// StockBatch
import 'package:fiap_farms/domain/use_cases/stock_batch/create_stock_batch_usecase.dart';
import 'package:fiap_farms/domain/use_cases/stock_batch/get_stock_batches_usecase.dart';
import 'package:fiap_farms/domain/use_cases/stock_batch/get_available_batches_usecase.dart';
import 'package:fiap_farms/domain/use_cases/stock_batch/allocate_batches_usecase.dart';
import 'package:fiap_farms/domain/use_cases/stock_batch/confirm_allocations_usecase.dart';
import 'package:fiap_farms/domain/use_cases/stock_batch/get_batches_by_production_usecase.dart';

// Sale
import 'package:fiap_farms/domain/use_cases/sale/create_sale_usecase.dart';
import 'package:fiap_farms/domain/use_cases/sale/get_sale_usecase.dart';
import 'package:fiap_farms/domain/use_cases/sale/get_sales_usecase.dart';
import 'package:fiap_farms/domain/use_cases/sale/update_sale_usecase.dart';
import 'package:fiap_farms/domain/use_cases/sale/delete_sale_usecase.dart';

// Goal
import 'package:fiap_farms/domain/use_cases/goal/create_goal_usecase.dart';
import 'package:fiap_farms/domain/use_cases/goal/get_goals_usecase.dart';
import 'package:fiap_farms/domain/use_cases/goal/update_goal_usecase.dart';
import 'package:fiap_farms/domain/use_cases/goal/delete_goal_usecase.dart';

void setupDomainModule(GetIt sl) {
  // Auth UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => CreateCredentialUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl<AuthRepository>()));

  // Product UseCases
  sl.registerLazySingleton(() => GetProductsUseCase(sl<ProductRepository>()));
  sl.registerLazySingleton(() => GetProductUseCase(sl<ProductRepository>()));
  sl.registerLazySingleton(() => CreateProductUseCase(sl<ProductRepository>()));
  sl.registerLazySingleton(() => UpdateProductUseCase(sl<ProductRepository>()));

  // Production UseCases
  sl.registerLazySingleton(() => GetProductionsUseCase(sl<ProductionRepository>()));
  sl.registerLazySingleton(() => GetProductionUseCase(sl<ProductionRepository>()));
  sl.registerLazySingleton(() => CreateProductionUseCase(sl<ProductionRepository>()));
  sl.registerLazySingleton(() => UpdateProductionUseCase(sl<ProductionRepository>()));
  sl.registerLazySingleton(() => DeleteProductionUseCase(sl<ProductionRepository>()));
  sl.registerLazySingleton(() => GetProductionsByStatusUseCase(sl<ProductionRepository>()));

  // Harvest UseCases
  sl.registerLazySingleton(() => CreateHarvestUseCase(sl<HarvestRepository>()));
  sl.registerLazySingleton(() => GetHarvestsUseCase(sl<HarvestRepository>()));
  sl.registerLazySingleton(() => GetHarvestsByProductionIdUseCase(sl<HarvestRepository>()));
  sl.registerLazySingleton(() => GetHarvestsByQualityUseCase(sl<HarvestRepository>()));
  sl.registerLazySingleton(() => UpdateHarvestUseCase(sl<HarvestRepository>()));
  sl.registerLazySingleton(() => DeleteHarvestUseCase(sl<HarvestRepository>()));

  // StockBatch UseCases
  sl.registerLazySingleton(() => CreateStockBatchUseCase(sl<StockBatchRepository>()));
  sl.registerLazySingleton(() => GetStockBatchesUseCase(sl<StockBatchRepository>()));
  sl.registerLazySingleton(() => GetAvailableBatchesUseCase(sl<StockBatchRepository>()));
  sl.registerLazySingleton(() => AllocateBatchesUseCase(sl<StockBatchRepository>()));
  sl.registerLazySingleton(() => ConfirmAllocationsUseCase(sl<StockBatchRepository>()));
  sl.registerLazySingleton(() => GetBatchesByProductionUseCase(sl<StockBatchRepository>()));

  // Sale UseCases
  sl.registerLazySingleton(() => CreateSaleUseCase(sl<SaleRepository>()));
  sl.registerLazySingleton(() => GetSaleUseCase(sl<SaleRepository>()));
  sl.registerLazySingleton(() => GetSalesUseCase(sl<SaleRepository>()));
  sl.registerLazySingleton(() => UpdateSaleUseCase(sl<SaleRepository>()));
  sl.registerLazySingleton(() => DeleteSaleUseCase(sl<SaleRepository>()));

  // Goal UseCases
  sl.registerLazySingleton(() => CreateGoalUseCase(sl<GoalRepository>()));
  sl.registerLazySingleton(() => GetGoalsUseCase(sl<GoalRepository>()));
  sl.registerLazySingleton(() => UpdateGoalUseCase(sl<GoalRepository>()));
  sl.registerLazySingleton(() => DeleteGoalUseCase(sl<GoalRepository>()));
}
