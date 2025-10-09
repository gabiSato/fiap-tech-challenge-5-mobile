import 'package:fiap_farms/domain/entities/harvest_entity.dart';

enum BatchStatus { available, reserved, soldOut, expired, damaged }

class StockBatchEntity {
  final String? id;
  final String userId;
  final String productId;
  final String productName;
  final String productionId;
  final String harvestId;
  final String batchNumber;
  final String? externalLotCode;
  final double initialQuantity;
  final double currentQuantity;
  final double reservedQuantity;
  final double soldQuantity;
  final double lostQuantity;
  final String unit;
  final double averageCostPerUnit;
  final double totalCost;
  final double productionCost;
  final double harvestCost;
  final double? processingCost;
  final double? storageCost;
  final HarvestQuality quality;
  final String? grade;
  final DateTime harvestDate;
  final DateTime? expirationDate;
  final DateTime receivedDate;
  final BatchStatus status;
  final String? warehouseLocation;
  final String? shelfPosition;
  final List<String>? certifications;
  final Map<String, dynamic>? inspectionResults;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StockBatchEntity({
    required this.userId,
    required this.productId,
    required this.productName,
    required this.productionId,
    required this.harvestId,
    required this.batchNumber,
    required this.initialQuantity,
    required this.currentQuantity,
    required this.reservedQuantity,
    required this.soldQuantity,
    required this.lostQuantity,
    required this.unit,
    required this.averageCostPerUnit,
    required this.totalCost,
    required this.productionCost,
    required this.harvestCost,
    required this.quality,
    required this.harvestDate,
    required this.receivedDate,
    required this.status,
    this.id,
    this.externalLotCode,
    this.processingCost,
    this.storageCost,
    this.grade,
    this.expirationDate,
    this.warehouseLocation,
    this.shelfPosition,
    this.certifications,
    this.inspectionResults,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });
}
