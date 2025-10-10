import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/entities/allocation_strategy.dart';
import 'package:fiap_farms/utils/result.dart';

class AllocateBatchesUseCase {
  final StockBatchRepository _stockBatchRepository;

  AllocateBatchesUseCase(this._stockBatchRepository);

  Future<Result<AllocationResultEntity>> call({
    required String userId,
    required String productId,
    required double quantity,
    AllocationStrategy strategy = AllocationStrategy.fifo,
  }) {
    return _stockBatchRepository.allocateBatches(
      userId: userId,
      productId: productId,
      quantity: quantity,
      strategy: strategy,
    );
  }
}
