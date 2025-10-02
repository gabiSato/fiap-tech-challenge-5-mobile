import 'package:cloud_firestore/cloud_firestore.dart';

class ProductionModel {
  final String? id;
  final String userId;
  final String productId;
  final String status;
  final int quantityPlanted;
  final int? quantityHarvested;
  final DateTime? startDate;
  final DateTime? harvestDate;

  ProductionModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.status,
    required this.quantityPlanted,
    required this.quantityHarvested,
    this.startDate,
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
      startDate: map['startDate'] != null
          ? (map['startDate'] as Timestamp).toDate()
          : null,
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
}
