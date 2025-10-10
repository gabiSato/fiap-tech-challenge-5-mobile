import 'package:fiap_farms/domain/entities/batch_allocation_entity.dart';

class SaleItemEntity {
  final String productId;
  final String productName;
  final String? productionId;
  final double quantity;
  final String unit;
  final double pricePerUnit;
  final double costPerUnit;
  final double totalPrice;
  final double totalCost;
  final double profit;
  final List<BatchAllocationEntity>? batchAllocations;

  SaleItemEntity({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unit,
    required this.pricePerUnit,
    required this.costPerUnit,
    required this.totalPrice,
    required this.totalCost,
    required this.profit,
    this.productionId,
    this.batchAllocations,
  });
}
