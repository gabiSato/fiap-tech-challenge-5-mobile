import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/domain/entities/production_status.dart';
import 'package:fiap_farms/domain/entities/sowing_method.dart';
import 'package:fiap_farms/domain/entities/area_unit.dart';

class ProductionModel {
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

  ProductionModel({
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

  factory ProductionModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductionModel(
      id: id,
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      quantityPlanted: (map['quantityPlanted'] ?? 0).toDouble(),
      quantityHarvested: map['quantityHarvested']?.toDouble(),
      unit: map['unit'] ?? '',
      status: ProductionStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => ProductionStatus.waiting,
      ),
      plantingDate: (map['plantingDate'] as Timestamp).toDate(),
      expectedHarvestDate: (map['expectedHarvestDate'] as Timestamp).toDate(),
      actualHarvestDate: map['actualHarvestDate'] != null
          ? (map['actualHarvestDate'] as Timestamp).toDate()
          : null,
      costPerUnit: (map['costPerUnit'] ?? 0).toDouble(),
      totalCost: (map['totalCost'] ?? 0).toDouble(),
      seedCost: map['seedCost']?.toDouble(),
      laborCost: map['laborCost']?.toDouble(),
      fertilizerCost: map['fertilizerCost']?.toDouble(),
      irrigationCost: map['irrigationCost']?.toDouble(),
      otherCosts: map['otherCosts']?.toDouble(),
      areaPlanted: map['areaPlanted']?.toDouble(),
      areaUnit: map['areaUnit'] != null
          ? AreaUnit.values.firstWhere(
              (e) => e.name == map['areaUnit'],
              orElse: () => AreaUnit.hectares,
            )
          : null,
      plotLocation: map['plotLocation'],
      varietyName: map['varietyName'],
      sowingMethod: map['sowingMethod'] != null
          ? SowingMethod.values.firstWhere(
              (e) => e.name == map['sowingMethod'],
              orElse: () => SowingMethod.direct,
            )
          : null,
      expectedYieldPerArea: map['expectedYieldPerArea']?.toDouble(),
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
      'quantityPlanted': quantityPlanted,
      'quantityHarvested': quantityHarvested,
      'unit': unit,
      'status': status.name,
      'plantingDate': Timestamp.fromDate(plantingDate),
      'expectedHarvestDate': Timestamp.fromDate(expectedHarvestDate),
      'actualHarvestDate': actualHarvestDate != null
          ? Timestamp.fromDate(actualHarvestDate!)
          : null,
      'costPerUnit': costPerUnit,
      'totalCost': totalCost,
      'seedCost': seedCost,
      'laborCost': laborCost,
      'fertilizerCost': fertilizerCost,
      'irrigationCost': irrigationCost,
      'otherCosts': otherCosts,
      'areaPlanted': areaPlanted,
      'areaUnit': areaUnit?.name,
      'plotLocation': plotLocation,
      'varietyName': varietyName,
      'sowingMethod': sowingMethod?.name,
      'expectedYieldPerArea': expectedYieldPerArea,
      'notes': notes,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : Timestamp.now(),
      'updatedAt': Timestamp.now(),
    };
  }

  factory ProductionModel.fromEntity(ProductionEntity entity) {
    return ProductionModel(
      id: entity.id,
      userId: entity.userId,
      productId: entity.productId,
      productName: entity.productName,
      quantityPlanted: entity.quantityPlanted,
      quantityHarvested: entity.quantityHarvested,
      unit: entity.unit,
      status: entity.status,
      plantingDate: entity.plantingDate,
      expectedHarvestDate: entity.expectedHarvestDate,
      actualHarvestDate: entity.actualHarvestDate,
      costPerUnit: entity.costPerUnit,
      totalCost: entity.totalCost,
      seedCost: entity.seedCost,
      laborCost: entity.laborCost,
      fertilizerCost: entity.fertilizerCost,
      irrigationCost: entity.irrigationCost,
      otherCosts: entity.otherCosts,
      areaPlanted: entity.areaPlanted,
      areaUnit: entity.areaUnit,
      plotLocation: entity.plotLocation,
      varietyName: entity.varietyName,
      sowingMethod: entity.sowingMethod,
      expectedYieldPerArea: entity.expectedYieldPerArea,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  ProductionEntity toEntity() {
    return ProductionEntity(
      id: id,
      userId: userId,
      productId: productId,
      productName: productName,
      quantityPlanted: quantityPlanted,
      quantityHarvested: quantityHarvested,
      unit: unit,
      status: status,
      plantingDate: plantingDate,
      expectedHarvestDate: expectedHarvestDate,
      actualHarvestDate: actualHarvestDate,
      costPerUnit: costPerUnit,
      totalCost: totalCost,
      seedCost: seedCost,
      laborCost: laborCost,
      fertilizerCost: fertilizerCost,
      irrigationCost: irrigationCost,
      otherCosts: otherCosts,
      areaPlanted: areaPlanted,
      areaUnit: areaUnit,
      plotLocation: plotLocation,
      varietyName: varietyName,
      sowingMethod: sowingMethod,
      expectedYieldPerArea: expectedYieldPerArea,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
