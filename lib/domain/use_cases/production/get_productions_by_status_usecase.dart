import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetProductionsByStatusUseCase {
  final ProductionRepository _productionRepository;

  GetProductionsByStatusUseCase(this._productionRepository);

  Future<Result<List<ProductionEntity>>> call(String userId, String status) {
    return _productionRepository.getProductionsByStatus(userId, status);
  }
}
