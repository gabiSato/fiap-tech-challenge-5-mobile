import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/data/sources/harvest_service.dart';
import 'package:fiap_farms/data/models/harvest_model.dart';
import 'package:fiap_farms/utils/result.dart';

class HarvestRepositoryImpl implements HarvestRepository {
  final HarvestService _harvestService;

  HarvestRepositoryImpl(this._harvestService);

  @override
  Future<Result<String>> createHarvest(HarvestEntity harvest) {
    final harvestModel = HarvestModel.fromEntity(harvest);
    return _harvestService.createHarvest(harvestModel);
  }

  @override
  Future<Result<void>> deleteHarvest(String harvestId) {
    return _harvestService.deleteHarvest(harvestId);
  }

  @override
  Future<Result<HarvestEntity>> getHarvest(String harvestId) async {
    final result = await _harvestService.getHarvest(harvestId);
    return switch (result) {
      Ok(value: final model) => Result.ok(model.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<HarvestEntity>>> getHarvestsByUserId(String userId) async {
    final result = await _harvestService.getHarvestsByUserId(userId);
    return switch (result) {
      Ok(value: final harvestModels) => Result.ok(
          harvestModels.map((model) => model.toEntity()).toList(),
        ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<HarvestEntity>>> getHarvestsByProductionId(
    String userId,
    String productionId,
  ) async {
    final result = await _harvestService.getHarvestsByProductionId(
      userId,
      productionId,
    );
    return switch (result) {
      Ok(value: final harvestModels) => Result.ok(
          harvestModels.map((model) => model.toEntity()).toList(),
        ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<HarvestEntity>>> getHarvestsByQuality(
    String userId,
    HarvestQuality quality,
  ) async {
    final result = await _harvestService.getHarvestsByQuality(userId, quality);
    return switch (result) {
      Ok(value: final harvestModels) => Result.ok(
          harvestModels.map((model) => model.toEntity()).toList(),
        ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<void>> updateHarvest(HarvestEntity harvest) {
    final harvestModel = HarvestModel.fromEntity(harvest);
    return _harvestService.updateHarvest(harvestModel);
  }
}
