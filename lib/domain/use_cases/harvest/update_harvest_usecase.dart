import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class UpdateHarvestUseCase {
  final HarvestRepository _harvestRepository;

  UpdateHarvestUseCase(this._harvestRepository);

  Future<Result<void>> call(HarvestEntity harvest) {
    return _harvestRepository.updateHarvest(harvest);
  }
}
