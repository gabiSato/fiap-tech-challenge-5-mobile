import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/domain/entities/stock_batch_entity.dart';
import 'package:fiap_farms/domain/entities/batch_status.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/domain/entities/quality_grade.dart';

class StockBatchModel {
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
  final QualityGrade? grade;
  final DateTime harvestDate;
  final DateTime? expirationDate;
  final DateTime receivedDate;
  final BatchStatus status;
  final String? warehouseLocation;
  final String? shelfPosition;
  final List<String>? certifications;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StockBatchModel({
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
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory StockBatchModel.fromMap(Map<String, dynamic> map, String id) {
    return StockBatchModel(
      id: id,
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      productionId: map['productionId'] ?? '',
      harvestId: map['harvestId'] ?? '',
      batchNumber: map['batchNumber'] ?? '',
      externalLotCode: map['externalLotCode'],
      initialQuantity: (map['initialQuantity'] ?? 0).toDouble(),
      currentQuantity: (map['currentQuantity'] ?? 0).toDouble(),
      reservedQuantity: (map['reservedQuantity'] ?? 0).toDouble(),
      soldQuantity: (map['soldQuantity'] ?? 0).toDouble(),
      lostQuantity: (map['lostQuantity'] ?? 0).toDouble(),
      unit: map['unit'] ?? '',
      averageCostPerUnit: (map['averageCostPerUnit'] ?? 0).toDouble(),
      totalCost: (map['totalCost'] ?? 0).toDouble(),
      productionCost: (map['productionCost'] ?? 0).toDouble(),
      harvestCost: (map['harvestCost'] ?? 0).toDouble(),
      processingCost: map['processingCost']?.toDouble(),
      storageCost: map['storageCost']?.toDouble(),
      quality: HarvestQuality.values.firstWhere(
        (e) => e.name == map['quality'],
        orElse: () => HarvestQuality.good,
      ),
      grade: map['grade'] != null
          ? QualityGrade.values.firstWhere(
              (e) => e.name == map['grade'],
              orElse: () => QualityGrade.a,
            )
          : null,
      harvestDate: (map['harvestDate'] as Timestamp).toDate(),
      expirationDate: map['expirationDate'] != null
          ? (map['expirationDate'] as Timestamp).toDate()
          : null,
      receivedDate: (map['receivedDate'] as Timestamp).toDate(),
      status: BatchStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => BatchStatus.available,
      ),
      warehouseLocation: map['warehouseLocation'],
      shelfPosition: map['shelfPosition'],
      certifications: map['certifications'] != null
          ? List<String>.from(map['certifications'])
          : null,
      notes: map['notes'],
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'productionId': productionId,
      'harvestId': harvestId,
      'batchNumber': batchNumber,
      'externalLotCode': externalLotCode,
      'initialQuantity': initialQuantity,
      'currentQuantity': currentQuantity,
      'reservedQuantity': reservedQuantity,
      'soldQuantity': soldQuantity,
      'lostQuantity': lostQuantity,
      'unit': unit,
      'averageCostPerUnit': averageCostPerUnit,
      'totalCost': totalCost,
      'productionCost': productionCost,
      'harvestCost': harvestCost,
      'processingCost': processingCost,
      'storageCost': storageCost,
      'quality': quality.name,
      'grade': grade?.name,
      'harvestDate': Timestamp.fromDate(harvestDate),
      'expirationDate': expirationDate != null
          ? Timestamp.fromDate(expirationDate!)
          : null,
      'receivedDate': Timestamp.fromDate(receivedDate),
      'status': status.name,
      'warehouseLocation': warehouseLocation,
      'shelfPosition': shelfPosition,
      'certifications': certifications,
      'notes': notes,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : Timestamp.now(),
      'updatedAt': Timestamp.now(),
    };
  }

  factory StockBatchModel.fromEntity(StockBatchEntity entity) {
    return StockBatchModel(
      id: entity.id,
      userId: entity.userId,
      productId: entity.productId,
      productName: entity.productName,
      productionId: entity.productionId,
      harvestId: entity.harvestId,
      batchNumber: entity.batchNumber,
      externalLotCode: entity.externalLotCode,
      initialQuantity: entity.initialQuantity,
      currentQuantity: entity.currentQuantity,
      reservedQuantity: entity.reservedQuantity,
      soldQuantity: entity.soldQuantity,
      lostQuantity: entity.lostQuantity,
      unit: entity.unit,
      averageCostPerUnit: entity.averageCostPerUnit,
      totalCost: entity.totalCost,
      productionCost: entity.productionCost,
      harvestCost: entity.harvestCost,
      processingCost: entity.processingCost,
      storageCost: entity.storageCost,
      quality: entity.quality,
      grade: entity.grade,
      harvestDate: entity.harvestDate,
      expirationDate: entity.expirationDate,
      receivedDate: entity.receivedDate,
      status: entity.status,
      warehouseLocation: entity.warehouseLocation,
      shelfPosition: entity.shelfPosition,
      certifications: entity.certifications,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  StockBatchEntity toEntity() {
    return StockBatchEntity(
      id: id,
      userId: userId,
      productId: productId,
      productName: productName,
      productionId: productionId,
      harvestId: harvestId,
      batchNumber: batchNumber,
      externalLotCode: externalLotCode,
      initialQuantity: initialQuantity,
      currentQuantity: currentQuantity,
      reservedQuantity: reservedQuantity,
      soldQuantity: soldQuantity,
      lostQuantity: lostQuantity,
      unit: unit,
      averageCostPerUnit: averageCostPerUnit,
      totalCost: totalCost,
      productionCost: productionCost,
      harvestCost: harvestCost,
      processingCost: processingCost,
      storageCost: storageCost,
      quality: quality,
      grade: grade,
      harvestDate: harvestDate,
      expirationDate: expirationDate,
      receivedDate: receivedDate,
      status: status,
      warehouseLocation: warehouseLocation,
      shelfPosition: shelfPosition,
      certifications: certifications,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
