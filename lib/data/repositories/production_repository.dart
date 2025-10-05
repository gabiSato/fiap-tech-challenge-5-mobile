import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';

import 'package:fiap_farms/data/sources/production_service.dart';
import 'package:fiap_farms/data/models/production_model.dart';

import 'package:fiap_farms/utils/result.dart';

class ProductionRepositoryImpl implements ProductionRepository {
  final ProductionService _productionService;

  ProductionRepositoryImpl(this._productionService);

  @override
  Future<Result<void>> createProduction(ProductionEntity production) {
    final productionModel = ProductionModel.fromEntity(production);
    return _productionService.createProduction(productionModel);
  }

  @override
  Future<Result<void>> deleteProduction(String productionId) {
    return _productionService.deleteProduction(productionId);
  }

  @override
  Future<Result<ProductionEntity>> getProduction(String productionId) async {
    final result = await _productionService.getProduction(productionId);
    return switch (result) {
      Ok(value: final model) => Result.ok(model.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<ProductionEntity>>> getProductions(String userId) async {
    final result = await _productionService.getProductions(userId);
    return switch (result) {
      Ok(value: final productionModels) => Result.ok(
        productionModels.map((model) => model.toEntity()).toList(),
      ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<ProductionEntity>>> getProductionsByStatus(
    String userId,
    String status,
  ) async {
    final result = await _productionService.getProductionsByStatus(
      userId,
      status,
    );
    return switch (result) {
      Ok(value: final productionModels) => Result.ok(
        productionModels.map((model) => model.toEntity()).toList(),
      ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<void>> updateProduction(ProductionEntity production) {
    final productionModel = ProductionModel.fromEntity(production);
    return _productionService.updateProduction(productionModel);
  }
}
