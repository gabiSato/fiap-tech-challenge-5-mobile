import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class CreateHarvestUseCase {
  final HarvestRepository _harvestRepository;

  CreateHarvestUseCase(this._harvestRepository);

  Future<Result<String>> call(HarvestEntity harvest) {
    return _harvestRepository.createHarvest(harvest);
  }
}
