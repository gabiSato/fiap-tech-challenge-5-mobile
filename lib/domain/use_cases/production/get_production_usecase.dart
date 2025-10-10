import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetProductionUseCase {
  final ProductionRepository _productionRepository;

  GetProductionUseCase(this._productionRepository);

  Future<Result<ProductionEntity>> call(String productionId) {
    return _productionRepository.getProduction(productionId);
  }
}
