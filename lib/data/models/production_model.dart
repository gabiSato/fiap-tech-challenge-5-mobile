import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/domain/entities/production_entity.dart';

class ProductionModel {
  final String? id;
  final String userId;
  final String productId;
  final String status;
  final double quantityPlanted;
  final DateTime startDate;
  final double? quantityHarvested;
  final DateTime? harvestDate;

  ProductionModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.status,
    required this.quantityPlanted,
    required this.startDate,
    this.quantityHarvested,
    this.harvestDate,
  });

  factory ProductionModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductionModel(
      id: id,
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      status: map['status'] ?? '',
      quantityPlanted: map['quantityPlanted'] ?? 0,
      quantityHarvested: map['quantityHarvested'] ?? 0,
      startDate: (map['startDate'] as Timestamp).toDate(),
      harvestDate: map['harvestDate'] != null
          ? (map['harvestDate'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
      'status': status,
      'quantityPlanted': quantityPlanted,
      'quantityHarvested': quantityHarvested,
      'startDate': startDate,
      'harvestDate': harvestDate,
    };
  }

  factory ProductionModel.fromEntity(ProductionEntity entity) {
    return ProductionModel(
      id: entity.id,
      userId: entity.userId,
      productId: entity.productId,
      status: entity.status,
      quantityPlanted: entity.quantityPlanted,
      quantityHarvested: entity.quantityHarvested,
      startDate: entity.startDate,
      harvestDate: entity.harvestDate,
    );
  }

  ProductionEntity toEntity() {
    return ProductionEntity(
      id: id,
      userId: userId,
      productId: productId,
      status: status,
      quantityPlanted: quantityPlanted,
      quantityHarvested: quantityHarvested,
      startDate: startDate,
      harvestDate: harvestDate,
    );
  }
}
