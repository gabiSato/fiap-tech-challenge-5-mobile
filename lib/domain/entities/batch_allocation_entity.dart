import 'package:fiap_farms/domain/entities/harvest_entity.dart';

class BatchAllocationEntity {
  final String batchId;
  final String batchNumber;
  final double quantityAllocated;
  final double costPerUnit;
  final HarvestQuality quality;
  final String? grade;
  final DateTime harvestDate;
  final String productionId;
  final String harvestId;

  BatchAllocationEntity({
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
}
