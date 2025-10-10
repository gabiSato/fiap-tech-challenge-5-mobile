import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetHarvestsUseCase {
  final HarvestRepository _harvestRepository;

  GetHarvestsUseCase(this._harvestRepository);

  Future<Result<List<HarvestEntity>>> call(String userId) {
    return _harvestRepository.getHarvestsByUserId(userId);
  }
}
