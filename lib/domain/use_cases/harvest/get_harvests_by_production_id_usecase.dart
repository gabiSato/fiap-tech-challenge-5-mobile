import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetHarvestsByProductionIdUseCase {
  final HarvestRepository _harvestRepository;

  GetHarvestsByProductionIdUseCase(this._harvestRepository);

  Future<Result<List<HarvestEntity>>> call(String userId, String productionId) {
    return _harvestRepository.getHarvestsByProductionId(userId, productionId);
  }
}
