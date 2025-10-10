import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/entities/stock_batch_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetBatchesByProductionUseCase {
  final StockBatchRepository _stockBatchRepository;

  GetBatchesByProductionUseCase(this._stockBatchRepository);

  Future<Result<List<StockBatchEntity>>> call(String userId, String productionId) {
    return _stockBatchRepository.getBatchesByProduction(userId, productionId);
  }
}
