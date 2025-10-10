import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class UpdateProductionUseCase {
  final ProductionRepository _productionRepository;

  UpdateProductionUseCase(this._productionRepository);

  Future<Result<void>> call(ProductionEntity production) {
    return _productionRepository.updateProduction(production);
  }
}
