import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/entities/stock_batch_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class CreateStockBatchUseCase {
  final StockBatchRepository _stockBatchRepository;

  CreateStockBatchUseCase(this._stockBatchRepository);

  Future<Result<String>> call(StockBatchEntity batch) {
    return _stockBatchRepository.createStockBatch(batch);
  }
}
