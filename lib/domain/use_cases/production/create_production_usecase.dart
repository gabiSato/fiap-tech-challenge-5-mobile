import 'package:fiap_farms/domain/repositories/production_repository.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';

import 'package:fiap_farms/utils/result.dart';

class CreateProductionUseCase {
  final ProductionRepository _repository;

  CreateProductionUseCase(this._repository);

  Future<Result<void>> call(ProductionEntity production) async {
    return await _repository.createProduction(production);
  }
}
