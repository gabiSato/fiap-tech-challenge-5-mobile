import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/entities/batch_allocation_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class ConfirmAllocationsUseCase {
  final StockBatchRepository _stockBatchRepository;

  ConfirmAllocationsUseCase(this._stockBatchRepository);

  Future<Result<void>> call(List<BatchAllocationEntity> allocations) {
    return _stockBatchRepository.confirmAllocations(allocations);
  }
}
