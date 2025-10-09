import 'package:fiap_farms/domain/entities/production_status.dart';
import 'package:fiap_farms/domain/entities/sowing_method.dart';
import 'package:fiap_farms/domain/entities/area_unit.dart';

class ProductionEntity {
  final String? id;
  final String userId;
  final String productId;
  final String productName;
  final double quantityPlanted;
  final double? quantityHarvested;
  final String unit;
  final ProductionStatus status;
  final DateTime plantingDate;
  final DateTime expectedHarvestDate;
  final DateTime? actualHarvestDate;
  final double costPerUnit;
  final double totalCost;
  final double? seedCost;
  final double? laborCost;
  final double? fertilizerCost;
  final double? irrigationCost;
  final double? otherCosts;
  final double? areaPlanted;
  final AreaUnit? areaUnit;
  final String? plotLocation;
  final String? varietyName;
  final SowingMethod? sowingMethod;
  final double? expectedYieldPerArea;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductionEntity({
    required this.userId,
    required this.productId,
    required this.productName,
    required this.quantityPlanted,
    required this.unit,
    required this.status,
    required this.plantingDate,
    required this.expectedHarvestDate,
    required this.costPerUnit,
    required this.totalCost,
    this.id,
    this.quantityHarvested,
    this.actualHarvestDate,
    this.seedCost,
    this.laborCost,
    this.fertilizerCost,
    this.irrigationCost,
    this.otherCosts,
    this.areaPlanted,
    this.areaUnit,
    this.plotLocation,
    this.varietyName,
    this.sowingMethod,
    this.expectedYieldPerArea,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });
}
