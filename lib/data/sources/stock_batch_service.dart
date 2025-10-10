import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/data/models/stock_batch_model.dart';
import 'package:fiap_farms/data/models/batch_allocation_model.dart';
import 'package:fiap_farms/domain/entities/allocation_strategy.dart';
import 'package:fiap_farms/domain/entities/batch_status.dart';
import 'package:fiap_farms/utils/firestore_collentions.dart';
import 'package:fiap_farms/utils/result.dart';

class AllocationResult {
  final List<BatchAllocationModel> allocations;
  final bool hasInsufficientStock;
  final double remainingQuantity;

  AllocationResult({
    required this.allocations,
    required this.hasInsufficientStock,
    required this.remainingQuantity,
  });
}

abstract class StockBatchService {
  Future<Result<StockBatchModel>> getStockBatch(String batchId);
  Future<Result<String>> createStockBatch(StockBatchModel batch);
  Future<Result<void>> updateStockBatch(StockBatchModel batch);
  Future<Result<void>> deleteStockBatch(String batchId);
  Future<Result<List<StockBatchModel>>> getStockBatchesByUserId(String userId);
  Future<Result<List<StockBatchModel>>> getAvailableBatches(
    String userId,
    String productId,
  );
  Future<Result<List<StockBatchModel>>> getBatchesByProduction(
    String userId,
    String productionId,
  );
  Future<Result<AllocationResult>> allocateBatches({
    required String userId,
    required String productId,
    required double quantity,
    required AllocationStrategy strategy,
  });
  Future<Result<void>> confirmAllocations(
    List<BatchAllocationModel> allocations,
  );
}

class StockBatchServiceImpl implements StockBatchService {
  final FirebaseFirestore _firestore;

  StockBatchServiceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<StockBatchModel>> getStockBatch(String batchId) async {
    try {
      final batchDoc = await _firestore
          .collection(FirestoreCollections.stockBatches)
          .doc(batchId)
          .get();

      if (!batchDoc.exists) {
        return Result.error(Exception('Stock batch not found'));
      }

      return Result.ok(StockBatchModel.fromMap(batchDoc.data()!, batchDoc.id));
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<String>> createStockBatch(StockBatchModel batch) async {
    try {
      final docRef = await _firestore
          .collection(FirestoreCollections.stockBatches)
          .add(batch.toMap());

      return Result.ok(docRef.id);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> updateStockBatch(StockBatchModel batch) async {
    try {
      if (batch.id == null) {
        return Result.error(Exception('Batch ID is required for update'));
      }

      await _firestore
          .collection(FirestoreCollections.stockBatches)
          .doc(batch.id)
          .update(batch.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> deleteStockBatch(String batchId) async {
    try {
      await _firestore
          .collection(FirestoreCollections.stockBatches)
          .doc(batchId)
          .delete();

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<StockBatchModel>>> getStockBatchesByUserId(
    String userId,
  ) async {
    try {
      final batchDocs = await _firestore
          .collection(FirestoreCollections.stockBatches)
          .where('userId', isEqualTo: userId)
          .get();

      List<StockBatchModel> batches = batchDocs.docs
          .map((doc) => StockBatchModel.fromMap(doc.data(), doc.id))
          .toList();

      batches.sort((a, b) => b.receivedDate.compareTo(a.receivedDate));

      return Result.ok(batches);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<StockBatchModel>>> getAvailableBatches(
    String userId,
    String productId,
  ) async {
    try {
      final batchDocs = await _firestore
          .collection(FirestoreCollections.stockBatches)
          .where('userId', isEqualTo: userId)
          .where('productId', isEqualTo: productId)
          .where('status', isEqualTo: BatchStatus.available.name)
          .get();

      List<StockBatchModel> batches = batchDocs.docs
          .map((doc) => StockBatchModel.fromMap(doc.data(), doc.id))
          .where((batch) => batch.currentQuantity > batch.reservedQuantity)
          .toList();

      return Result.ok(batches);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<StockBatchModel>>> getBatchesByProduction(
    String userId,
    String productionId,
  ) async {
    try {
      final batchDocs = await _firestore
          .collection(FirestoreCollections.stockBatches)
          .where('userId', isEqualTo: userId)
          .where('productionId', isEqualTo: productionId)
          .get();

      List<StockBatchModel> batches = batchDocs.docs
          .map((doc) => StockBatchModel.fromMap(doc.data(), doc.id))
          .toList();

      batches.sort((a, b) => b.receivedDate.compareTo(a.receivedDate));

      return Result.ok(batches);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<AllocationResult>> allocateBatches({
    required String userId,
    required String productId,
    required double quantity,
    required AllocationStrategy strategy,
  }) async {
    try {
      final batchesResult = await getAvailableBatches(userId, productId);

      if (batchesResult is Error) {
        return Result.error((batchesResult as Error).error);
      }

      List<StockBatchModel> batches = (batchesResult as Ok).value;

      List<StockBatchModel> sortedBatches = _sortByStrategy(batches, strategy);

      List<BatchAllocationModel> allocations = [];
      double remaining = quantity;

      for (final batch in sortedBatches) {
        if (remaining <= 0) break;

        final availableInBatch = batch.currentQuantity - batch.reservedQuantity;
        if (availableInBatch <= 0) continue;

        final allocated = remaining < availableInBatch
            ? remaining
            : availableInBatch;

        allocations.add(
          BatchAllocationModel(
            batchId: batch.id!,
            batchNumber: batch.batchNumber,
            quantityAllocated: allocated,
            costPerUnit: batch.averageCostPerUnit,
            quality: batch.quality,
            grade: batch.grade?.name,
            harvestDate: batch.harvestDate,
            productionId: batch.productionId,
            harvestId: batch.harvestId,
          ),
        );

        remaining -= allocated;
      }

      return Result.ok(
        AllocationResult(
          allocations: allocations,
          hasInsufficientStock: remaining > 0,
          remainingQuantity: remaining,
        ),
      );
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> confirmAllocations(
    List<BatchAllocationModel> allocations,
  ) async {
    try {
      final batch = _firestore.batch();

      for (final allocation in allocations) {
        final batchRef = _firestore
            .collection(FirestoreCollections.stockBatches)
            .doc(allocation.batchId);

        final batchDoc = await batchRef.get();
        if (!batchDoc.exists) continue;

        final stockBatch = StockBatchModel.fromMap(
          batchDoc.data()!,
          batchDoc.id,
        );

        final newCurrentQuantity =
            stockBatch.currentQuantity - allocation.quantityAllocated;
        final newSoldQuantity =
            stockBatch.soldQuantity + allocation.quantityAllocated;

        BatchStatus newStatus = stockBatch.status;
        if (newCurrentQuantity <= 0) {
          newStatus = BatchStatus.soldOut;
        }

        batch.update(batchRef, {
          'currentQuantity': newCurrentQuantity,
          'soldQuantity': newSoldQuantity,
          'status': newStatus.name,
          'updatedAt': Timestamp.now(),
        });
      }

      await batch.commit();
      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  List<StockBatchModel> _sortByStrategy(
    List<StockBatchModel> batches,
    AllocationStrategy strategy,
  ) {
    List<StockBatchModel> sorted = List.from(batches);

    switch (strategy) {
      case AllocationStrategy.fifo:
        sorted.sort((a, b) => a.receivedDate.compareTo(b.receivedDate));
        break;

      case AllocationStrategy.lifo:
        sorted.sort((a, b) => b.receivedDate.compareTo(a.receivedDate));
        break;

      case AllocationStrategy.fefo:
        sorted.sort((a, b) {
          if (a.expirationDate == null && b.expirationDate == null) return 0;
          if (a.expirationDate == null) return 1;
          if (b.expirationDate == null) return -1;
          return a.expirationDate!.compareTo(b.expirationDate!);
        });
        break;
    }

    return sorted;
  }
}
