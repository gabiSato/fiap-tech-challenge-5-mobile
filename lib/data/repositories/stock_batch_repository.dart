import 'package:fiap_farms/domain/repositories/stock_batch_repository.dart';
import 'package:fiap_farms/domain/entities/stock_batch_entity.dart';
import 'package:fiap_farms/domain/entities/batch_allocation_entity.dart';
import 'package:fiap_farms/domain/entities/allocation_strategy.dart';
import 'package:fiap_farms/data/sources/stock_batch_service.dart';
import 'package:fiap_farms/data/models/stock_batch_model.dart';
import 'package:fiap_farms/data/models/batch_allocation_model.dart';
import 'package:fiap_farms/utils/result.dart';

class StockBatchRepositoryImpl implements StockBatchRepository {
  final StockBatchService _stockBatchService;

  StockBatchRepositoryImpl(this._stockBatchService);

  @override
  Future<Result<String>> createStockBatch(StockBatchEntity batch) {
    final batchModel = StockBatchModel.fromEntity(batch);
    return _stockBatchService.createStockBatch(batchModel);
  }

  @override
  Future<Result<void>> deleteStockBatch(String batchId) {
    return _stockBatchService.deleteStockBatch(batchId);
  }

  @override
  Future<Result<StockBatchEntity>> getStockBatch(String batchId) async {
    final result = await _stockBatchService.getStockBatch(batchId);
    return switch (result) {
      Ok(value: final model) => Result.ok(model.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<StockBatchEntity>>> getStockBatchesByUserId(
    String userId,
  ) async {
    final result = await _stockBatchService.getStockBatchesByUserId(userId);
    return switch (result) {
      Ok(value: final batchModels) => Result.ok(
          batchModels.map((model) => model.toEntity()).toList(),
        ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<StockBatchEntity>>> getAvailableBatches(
    String userId,
    String productId,
  ) async {
    final result = await _stockBatchService.getAvailableBatches(
      userId,
      productId,
    );
    return switch (result) {
      Ok(value: final batchModels) => Result.ok(
          batchModels.map((model) => model.toEntity()).toList(),
        ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<StockBatchEntity>>> getBatchesByProduction(
    String userId,
    String productionId,
  ) async {
    final result = await _stockBatchService.getBatchesByProduction(
      userId,
      productionId,
    );
    return switch (result) {
      Ok(value: final batchModels) => Result.ok(
          batchModels.map((model) => model.toEntity()).toList(),
        ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<AllocationResultEntity>> allocateBatches({
    required String userId,
    required String productId,
    required double quantity,
    required AllocationStrategy strategy,
  }) async {
    final result = await _stockBatchService.allocateBatches(
      userId: userId,
      productId: productId,
      quantity: quantity,
      strategy: strategy,
    );

    return switch (result) {
      Ok(value: final allocationResult) => Result.ok(
          AllocationResultEntity(
            allocations: allocationResult.allocations
                .map((model) => model.toEntity())
                .toList(),
            hasInsufficientStock: allocationResult.hasInsufficientStock,
            remainingQuantity: allocationResult.remainingQuantity,
          ),
        ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<void>> confirmAllocations(
    List<BatchAllocationEntity> allocations,
  ) {
    final allocationModels = allocations
        .map((entity) => BatchAllocationModel.fromEntity(entity))
        .toList();

    return _stockBatchService.confirmAllocations(allocationModels);
  }

  @override
  Future<Result<void>> updateStockBatch(StockBatchEntity batch) {
    final batchModel = StockBatchModel.fromEntity(batch);
    return _stockBatchService.updateStockBatch(batchModel);
  }
}
