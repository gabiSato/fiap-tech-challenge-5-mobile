import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/utils/result.dart';

class DeleteHarvestUseCase {
  final HarvestRepository _harvestRepository;

  DeleteHarvestUseCase(this._harvestRepository);

  Future<Result<void>> call(String harvestId) {
    return _harvestRepository.deleteHarvest(harvestId);
  }
}
