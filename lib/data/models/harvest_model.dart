import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';

class HarvestModel {
  final String? id;
  final String userId;
  final String productionId;
  final String productId;
  final String productName;
  final double quantityHarvested;
  final String unit;
  final double? quantityLost;
  final double? lossPercentage;
  final HarvestQuality quality;
  final DateTime harvestDate;
  final String? harvestStartTime;
  final String? harvestEndTime;
  final double? harvestCost;
  final double? laborCost;
  final double? equipmentCost;
  final double? transportCost;
  final String? weatherConditions;
  final double? temperature;
  final double? humidity;
  final int? workersCount;
  final double? hoursWorked;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  HarvestModel({
    required this.userId,
    required this.productionId,
    required this.productId,
    required this.productName,
    required this.quantityHarvested,
    required this.unit,
    required this.quality,
    required this.harvestDate,
    this.id,
    this.quantityLost,
    this.lossPercentage,
    this.harvestStartTime,
    this.harvestEndTime,
    this.harvestCost,
    this.laborCost,
    this.equipmentCost,
    this.transportCost,
    this.weatherConditions,
    this.temperature,
    this.humidity,
    this.workersCount,
    this.hoursWorked,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory HarvestModel.fromMap(Map<String, dynamic> map, String id) {
    return HarvestModel(
      id: id,
      userId: map['userId'] ?? '',
      productionId: map['productionId'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      quantityHarvested: (map['quantityHarvested'] ?? 0).toDouble(),
      unit: map['unit'] ?? '',
      quantityLost: map['quantityLost']?.toDouble(),
      lossPercentage: map['lossPercentage']?.toDouble(),
      quality: HarvestQuality.values.firstWhere(
        (e) => e.name == map['quality'],
        orElse: () => HarvestQuality.good,
      ),
      harvestDate: (map['harvestDate'] as Timestamp).toDate(),
      harvestStartTime: map['harvestStartTime'],
      harvestEndTime: map['harvestEndTime'],
      harvestCost: map['harvestCost']?.toDouble(),
      laborCost: map['laborCost']?.toDouble(),
      equipmentCost: map['equipmentCost']?.toDouble(),
      transportCost: map['transportCost']?.toDouble(),
      weatherConditions: map['weatherConditions'],
      temperature: map['temperature']?.toDouble(),
      humidity: map['humidity']?.toDouble(),
      workersCount: map['workersCount'],
      hoursWorked: map['hoursWorked']?.toDouble(),
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
      'productionId': productionId,
      'productId': productId,
      'productName': productName,
      'quantityHarvested': quantityHarvested,
      'unit': unit,
      'quantityLost': quantityLost,
      'lossPercentage': lossPercentage,
      'quality': quality.name,
      'harvestDate': Timestamp.fromDate(harvestDate),
      'harvestStartTime': harvestStartTime,
      'harvestEndTime': harvestEndTime,
      'harvestCost': harvestCost,
      'laborCost': laborCost,
      'equipmentCost': equipmentCost,
      'transportCost': transportCost,
      'weatherConditions': weatherConditions,
      'temperature': temperature,
      'humidity': humidity,
      'workersCount': workersCount,
      'hoursWorked': hoursWorked,
      'notes': notes,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : Timestamp.now(),
      'updatedAt': Timestamp.now(),
    };
  }

  factory HarvestModel.fromEntity(HarvestEntity entity) {
    return HarvestModel(
      id: entity.id,
      userId: entity.userId,
      productionId: entity.productionId,
      productId: entity.productId,
      productName: entity.productName,
      quantityHarvested: entity.quantityHarvested,
      unit: entity.unit,
      quantityLost: entity.quantityLost,
      lossPercentage: entity.lossPercentage,
      quality: entity.quality,
      harvestDate: entity.harvestDate,
      harvestStartTime: entity.harvestStartTime,
      harvestEndTime: entity.harvestEndTime,
      harvestCost: entity.harvestCost,
      laborCost: entity.laborCost,
      equipmentCost: entity.equipmentCost,
      transportCost: entity.transportCost,
      weatherConditions: entity.weatherConditions,
      temperature: entity.temperature,
      humidity: entity.humidity,
      workersCount: entity.workersCount,
      hoursWorked: entity.hoursWorked,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  HarvestEntity toEntity() {
    return HarvestEntity(
      id: id,
      userId: userId,
      productionId: productionId,
      productId: productId,
      productName: productName,
      quantityHarvested: quantityHarvested,
      unit: unit,
      quantityLost: quantityLost,
      lossPercentage: lossPercentage,
      quality: quality,
      harvestDate: harvestDate,
      harvestStartTime: harvestStartTime,
      harvestEndTime: harvestEndTime,
      harvestCost: harvestCost,
      laborCost: laborCost,
      equipmentCost: equipmentCost,
      transportCost: transportCost,
      weatherConditions: weatherConditions,
      temperature: temperature,
      humidity: humidity,
      workersCount: workersCount,
      hoursWorked: hoursWorked,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
