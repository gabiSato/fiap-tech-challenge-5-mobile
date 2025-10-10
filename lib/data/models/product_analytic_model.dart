import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/domain/entities/product_analytic_entity.dart';

class ProductAnalyticModel {
  final String? id;
  final String userId;
  final String productId;
  final String productName;
  final double totalRevenue;
  final double totalQuantitySold;
  final double totalCost;
  final double profit;
  final double profitMargin;
  final double averagePrice;
  final DateTime periodStartDate;
  final DateTime periodEndDate;
  final DateTime? lastUpdated;

  ProductAnalyticModel({
    required this.userId,
    required this.productId,
    required this.productName,
    required this.totalRevenue,
    required this.totalQuantitySold,
    required this.totalCost,
    required this.profit,
    required this.profitMargin,
    required this.averagePrice,
    required this.periodStartDate,
    required this.periodEndDate,
    this.id,
    this.lastUpdated,
  });

  factory ProductAnalyticModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductAnalyticModel(
      id: id,
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      totalRevenue: (map['totalRevenue'] ?? 0).toDouble(),
      totalQuantitySold: (map['totalQuantitySold'] ?? 0).toDouble(),
      totalCost: (map['totalCost'] ?? 0).toDouble(),
      profit: (map['profit'] ?? 0).toDouble(),
      profitMargin: (map['profitMargin'] ?? 0).toDouble(),
      averagePrice: (map['averagePrice'] ?? 0).toDouble(),
      periodStartDate: (map['periodStartDate'] as Timestamp).toDate(),
      periodEndDate: (map['periodEndDate'] as Timestamp).toDate(),
      lastUpdated: map['lastUpdated'] != null
          ? (map['lastUpdated'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'totalRevenue': totalRevenue,
      'totalQuantitySold': totalQuantitySold,
      'totalCost': totalCost,
      'profit': profit,
      'profitMargin': profitMargin,
      'averagePrice': averagePrice,
      'periodStartDate': Timestamp.fromDate(periodStartDate),
      'periodEndDate': Timestamp.fromDate(periodEndDate),
      'lastUpdated': lastUpdated != null
          ? Timestamp.fromDate(lastUpdated!)
          : null,
    };
  }

  factory ProductAnalyticModel.fromEntity(ProductAnalyticEntity entity) {
    return ProductAnalyticModel(
      id: entity.id,
      userId: entity.userId,
      productId: entity.productId,
      productName: entity.productName,
      totalRevenue: entity.totalRevenue,
      totalQuantitySold: entity.totalQuantitySold,
      totalCost: entity.totalCost,
      profit: entity.profit,
      profitMargin: entity.profitMargin,
      averagePrice: entity.averagePrice,
      periodStartDate: entity.periodStartDate,
      periodEndDate: entity.periodEndDate,
      lastUpdated: entity.lastUpdated,
    );
  }

  ProductAnalyticEntity toEntity() {
    return ProductAnalyticEntity(
      id: id,
      userId: userId,
      productId: productId,
      productName: productName,
      totalRevenue: totalRevenue,
      totalQuantitySold: totalQuantitySold,
      totalCost: totalCost,
      profit: profit,
      profitMargin: profitMargin,
      averagePrice: averagePrice,
      periodStartDate: periodStartDate,
      periodEndDate: periodEndDate,
      lastUpdated: lastUpdated,
    );
  }
}
