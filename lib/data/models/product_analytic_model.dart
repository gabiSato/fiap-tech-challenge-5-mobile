import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/domain/entities/product_analytic_entity.dart';

class ProductAnalyticModel {
  final String userId;
  final String productId;
  final String productName;
  final double totalSoldQuantity;
  final double totalRevenue;
  final double totalProfit;
  final DateTime lastSaleDate;

  ProductAnalyticModel({
    required this.userId,
    required this.productId,
    required this.productName,
    required this.totalSoldQuantity,
    required this.totalRevenue,
    required this.totalProfit,
    required this.lastSaleDate,
  });

  factory ProductAnalyticModel.fromMap(Map<String, dynamic> map) {
    return ProductAnalyticModel(
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      totalSoldQuantity: (map['totalSoldQuantity'] ?? 0).toDouble(),
      totalRevenue: (map['totalRevenue'] ?? 0).toDouble(),
      totalProfit: (map['totalProfit'] ?? 0).toDouble(),
      lastSaleDate: (map['lastSaleDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'totalSoldQuantity': totalSoldQuantity,
      'totalRevenue': totalRevenue,
      'totalProfit': totalProfit,
      'lastSaleDate': lastSaleDate,
    };
  }

  ProductAnalyticEntity toEntity() {
    return ProductAnalyticEntity(
      userId: userId,
      productId: productId,
      productName: productName,
      totalSoldQuantity: totalSoldQuantity,
      totalRevenue: totalRevenue,
      totalProfit: totalProfit,
      lastSaleDate: lastSaleDate,
    );
  }

  factory ProductAnalyticModel.fromEntity(ProductAnalyticEntity entity) {
    return ProductAnalyticModel(
      userId: entity.userId,
      productId: entity.productId,
      productName: entity.productName,
      totalSoldQuantity: entity.totalSoldQuantity,
      totalRevenue: entity.totalRevenue,
      totalProfit: entity.totalProfit,
      lastSaleDate: entity.lastSaleDate,
    );
  }
}
