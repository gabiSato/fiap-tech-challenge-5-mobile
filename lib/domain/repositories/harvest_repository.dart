import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class HarvestRepository {
  Future<Result<HarvestEntity>> getHarvest(String harvestId);
  Future<Result<String>> createHarvest(HarvestEntity harvest);
  Future<Result<void>> updateHarvest(HarvestEntity harvest);
  Future<Result<void>> deleteHarvest(String harvestId);
  Future<Result<List<HarvestEntity>>> getHarvestsByUserId(String userId);
  Future<Result<List<HarvestEntity>>> getHarvestsByProductionId(
    String userId,
    String productionId,
  );
  Future<Result<List<HarvestEntity>>> getHarvestsByQuality(
    String userId,
    HarvestQuality quality,
  );
}
