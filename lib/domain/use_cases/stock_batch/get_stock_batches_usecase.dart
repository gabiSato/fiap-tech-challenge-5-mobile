import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/entities/stock_batch_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetStockBatchesUseCase {
  final StockBatchRepository _stockBatchRepository;

  GetStockBatchesUseCase(this._stockBatchRepository);

  Future<Result<List<StockBatchEntity>>> call(String userId) {
    return _stockBatchRepository.getStockBatchesByUserId(userId);
  }
}
