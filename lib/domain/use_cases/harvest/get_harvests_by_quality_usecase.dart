import 'package:fiap_farms/domain/repositories/harvest_repository.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetHarvestsByQualityUseCase {
  final HarvestRepository _harvestRepository;

  GetHarvestsByQualityUseCase(this._harvestRepository);

  Future<Result<List<HarvestEntity>>> call(
    String userId,
    HarvestQuality quality,
  ) {
    return _harvestRepository.getHarvestsByQuality(userId, quality);
  }
}
