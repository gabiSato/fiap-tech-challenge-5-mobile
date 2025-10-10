import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class ProductionRepository {
  Future<Result<ProductionEntity>> getProduction(String productionId);
  Future<Result<void>> createProduction(ProductionEntity production);
  Future<Result<void>> updateProduction(ProductionEntity production);
  Future<Result<void>> deleteProduction(String productionId);
  Future<Result<List<ProductionEntity>>> getProductions(String userId);
  Future<Result<List<ProductionEntity>>> getProductionsByStatus(
    String userId,
    String status,
  );
}
