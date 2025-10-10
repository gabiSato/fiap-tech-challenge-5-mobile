import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/entities/stock_batch_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetAvailableBatchesUseCase {
  final StockBatchRepository _stockBatchRepository;

  GetAvailableBatchesUseCase(this._stockBatchRepository);

  Future<Result<List<StockBatchEntity>>> call(String userId, String productId) {
    return _stockBatchRepository.getAvailableBatches(userId, productId);
  }
}
