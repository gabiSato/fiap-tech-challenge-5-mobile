import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/utils/result.dart';

class DeleteProductionUseCase {
  final ProductionRepository _productionRepository;

  DeleteProductionUseCase(this._productionRepository);

  Future<Result<void>> call(String productionId) {
    return _productionRepository.deleteProduction(productionId);
  }
}
