import 'package:fiap_farms/domain/entities/stock_batch_entity.dart';
import 'package:fiap_farms/domain/entities/batch_allocation_entity.dart';
import 'package:fiap_farms/domain/entities/allocation_strategy.dart';
import 'package:fiap_farms/utils/result.dart';

class AllocationResultEntity {
  final List<BatchAllocationEntity> allocations;
  final bool hasInsufficientStock;
  final double remainingQuantity;

  AllocationResultEntity({
    required this.allocations,
    required this.hasInsufficientStock,
    required this.remainingQuantity,
  });
}

abstract class StockBatchRepository {
  Future<Result<StockBatchEntity>> getStockBatch(String batchId);
  Future<Result<String>> createStockBatch(StockBatchEntity batch);
  Future<Result<void>> updateStockBatch(StockBatchEntity batch);
  Future<Result<void>> deleteStockBatch(String batchId);
  Future<Result<List<StockBatchEntity>>> getStockBatchesByUserId(String userId);
  Future<Result<List<StockBatchEntity>>> getAvailableBatches(
    String userId,
    String productId,
  );
  Future<Result<List<StockBatchEntity>>> getBatchesByProduction(
    String userId,
    String productionId,
  );
  Future<Result<AllocationResultEntity>> allocateBatches({
    required String userId,
    required String productId,
    required double quantity,
    required AllocationStrategy strategy,
  });
  Future<Result<void>> confirmAllocations(List<BatchAllocationEntity> allocations);
}
