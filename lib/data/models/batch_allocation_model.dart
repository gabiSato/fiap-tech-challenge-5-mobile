import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/domain/entities/batch_allocation_entity.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';

class BatchAllocationModel {
  final String batchId;
  final String batchNumber;
  final double quantityAllocated;
  final double costPerUnit;
  final HarvestQuality quality;
  final String? grade;
  final DateTime harvestDate;
  final String productionId;
  final String harvestId;

  BatchAllocationModel({
    required this.batchId,
    required this.batchNumber,
    required this.quantityAllocated,
    required this.costPerUnit,
    required this.quality,
    required this.harvestDate,
    required this.productionId,
    required this.harvestId,
    this.grade,
  });

  factory BatchAllocationModel.fromMap(Map<String, dynamic> map) {
    return BatchAllocationModel(
      batchId: map['batchId'] ?? '',
      batchNumber: map['batchNumber'] ?? '',
      quantityAllocated: (map['quantityAllocated'] ?? 0).toDouble(),
      costPerUnit: (map['costPerUnit'] ?? 0).toDouble(),
      quality: HarvestQuality.values.firstWhere(
        (e) => e.name == map['quality'],
        orElse: () => HarvestQuality.good,
      ),
      grade: map['grade'],
      harvestDate: (map['harvestDate'] as Timestamp).toDate(),
      productionId: map['productionId'] ?? '',
      harvestId: map['harvestId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'batchId': batchId,
      'batchNumber': batchNumber,
      'quantityAllocated': quantityAllocated,
      'costPerUnit': costPerUnit,
      'quality': quality.name,
      'grade': grade,
      'harvestDate': Timestamp.fromDate(harvestDate),
      'productionId': productionId,
      'harvestId': harvestId,
    };
  }

  factory BatchAllocationModel.fromEntity(BatchAllocationEntity entity) {
    return BatchAllocationModel(
      batchId: entity.batchId,
      batchNumber: entity.batchNumber,
      quantityAllocated: entity.quantityAllocated,
      costPerUnit: entity.costPerUnit,
      quality: entity.quality,
      grade: entity.grade,
      harvestDate: entity.harvestDate,
      productionId: entity.productionId,
      harvestId: entity.harvestId,
    );
  }

  BatchAllocationEntity toEntity() {
    return BatchAllocationEntity(
      batchId: batchId,
      batchNumber: batchNumber,
      quantityAllocated: quantityAllocated,
      costPerUnit: costPerUnit,
      quality: quality,
      grade: grade,
      harvestDate: harvestDate,
      productionId: productionId,
      harvestId: harvestId,
    );
  }
}
