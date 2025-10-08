import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';

import 'package:fiap_farms/utils/result.dart';

class GetProductionsUseCase {
  final ProductionRepository _productionRepository;

  GetProductionsUseCase(this._productionRepository);

  Future<Result<List<ProductionEntity>>> call(String userId) {
    return _productionRepository.getProductions(userId);
  }
}
