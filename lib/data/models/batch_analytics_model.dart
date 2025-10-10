import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/domain/entities/batch_analytics_entity.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/domain/entities/quality_grade.dart';

class BatchAnalyticsModel {
  final String? id;
  final String userId;
  final String batchId;
  final String batchNumber;
  final String productId;
  final String productName;
  final String productionId;
  final String harvestId;
  final double initialQuantity;
  final double quantitySold;
  final double quantityRemaining;
  final double quantityLost;
  final double quantityReserved;
  final double soldPercentage;
  final double lossPercentage;
  final double totalCost;
  final double costPerUnit;
  final double productionCost;
  final double harvestCost;
  final double processingCost;
  final double storageCost;
  final double totalRevenue;
  final double totalProfit;
  final double profitMargin;
  final double averageSalePrice;
  final int numberOfSales;
  final int daysInStock;
  final double turnoverRate;
  final double roi;
  final HarvestQuality quality;
  final QualityGrade? grade;
  final bool isActive;
  final bool isSoldOut;
  final bool isExpired;
  final DateTime periodStart;
  final DateTime periodEnd;
  final int? paybackPeriod;
  final double? profitPerDay;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BatchAnalyticsModel({
    required this.userId,
    required this.batchId,
    required this.batchNumber,
    required this.productId,
    required this.productName,
    required this.productionId,
    required this.harvestId,
    required this.initialQuantity,
    required this.quantitySold,
    required this.quantityRemaining,
    required this.quantityLost,
    required this.quantityReserved,
    required this.soldPercentage,
    required this.lossPercentage,
    required this.totalCost,
    required this.costPerUnit,
    required this.productionCost,
    required this.harvestCost,
    required this.processingCost,
    required this.storageCost,
    required this.totalRevenue,
    required this.totalProfit,
    required this.profitMargin,
    required this.averageSalePrice,
    required this.numberOfSales,
    required this.daysInStock,
    required this.turnoverRate,
    required this.roi,
    required this.quality,
    required this.isActive,
    required this.isSoldOut,
    required this.isExpired,
    required this.periodStart,
    required this.periodEnd,
    this.id,
    this.grade,
    this.paybackPeriod,
    this.profitPerDay,
    this.createdAt,
    this.updatedAt,
  });

  factory BatchAnalyticsModel.fromMap(Map<String, dynamic> map, String id) {
    return BatchAnalyticsModel(
      id: id,
      userId: map['userId'] ?? '',
      batchId: map['batchId'] ?? '',
      batchNumber: map['batchNumber'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      productionId: map['productionId'] ?? '',
      harvestId: map['harvestId'] ?? '',
      initialQuantity: (map['initialQuantity'] ?? 0).toDouble(),
      quantitySold: (map['quantitySold'] ?? 0).toDouble(),
      quantityRemaining: (map['quantityRemaining'] ?? 0).toDouble(),
      quantityLost: (map['quantityLost'] ?? 0).toDouble(),
      quantityReserved: (map['quantityReserved'] ?? 0).toDouble(),
      soldPercentage: (map['soldPercentage'] ?? 0).toDouble(),
      lossPercentage: (map['lossPercentage'] ?? 0).toDouble(),
      totalCost: (map['totalCost'] ?? 0).toDouble(),
      costPerUnit: (map['costPerUnit'] ?? 0).toDouble(),
      productionCost: (map['productionCost'] ?? 0).toDouble(),
      harvestCost: (map['harvestCost'] ?? 0).toDouble(),
      processingCost: (map['processingCost'] ?? 0).toDouble(),
      storageCost: (map['storageCost'] ?? 0).toDouble(),
      totalRevenue: (map['totalRevenue'] ?? 0).toDouble(),
      totalProfit: (map['totalProfit'] ?? 0).toDouble(),
      profitMargin: (map['profitMargin'] ?? 0).toDouble(),
      averageSalePrice: (map['averageSalePrice'] ?? 0).toDouble(),
      numberOfSales: map['numberOfSales'] ?? 0,
      daysInStock: map['daysInStock'] ?? 0,
      turnoverRate: (map['turnoverRate'] ?? 0).toDouble(),
      roi: (map['roi'] ?? 0).toDouble(),
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
      isActive: map['isActive'] ?? false,
      isSoldOut: map['isSoldOut'] ?? false,
      isExpired: map['isExpired'] ?? false,
      periodStart: (map['periodStart'] as Timestamp).toDate(),
      periodEnd: (map['periodEnd'] as Timestamp).toDate(),
      paybackPeriod: map['paybackPeriod'],
      profitPerDay: map['profitPerDay']?.toDouble(),
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
      'batchId': batchId,
      'batchNumber': batchNumber,
      'productId': productId,
      'productName': productName,
      'productionId': productionId,
      'harvestId': harvestId,
      'initialQuantity': initialQuantity,
      'quantitySold': quantitySold,
      'quantityRemaining': quantityRemaining,
      'quantityLost': quantityLost,
      'quantityReserved': quantityReserved,
      'soldPercentage': soldPercentage,
      'lossPercentage': lossPercentage,
      'totalCost': totalCost,
      'costPerUnit': costPerUnit,
      'productionCost': productionCost,
      'harvestCost': harvestCost,
      'processingCost': processingCost,
      'storageCost': storageCost,
      'totalRevenue': totalRevenue,
      'totalProfit': totalProfit,
      'profitMargin': profitMargin,
      'averageSalePrice': averageSalePrice,
      'numberOfSales': numberOfSales,
      'daysInStock': daysInStock,
      'turnoverRate': turnoverRate,
      'roi': roi,
      'quality': quality.name,
      'grade': grade?.name,
      'isActive': isActive,
      'isSoldOut': isSoldOut,
      'isExpired': isExpired,
      'periodStart': Timestamp.fromDate(periodStart),
      'periodEnd': Timestamp.fromDate(periodEnd),
      'paybackPeriod': paybackPeriod,
      'profitPerDay': profitPerDay,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : Timestamp.now(),
      'updatedAt': Timestamp.now(),
    };
  }

  factory BatchAnalyticsModel.fromEntity(BatchAnalyticsEntity entity) {
    return BatchAnalyticsModel(
      id: entity.id,
      userId: entity.userId,
      batchId: entity.batchId,
      batchNumber: entity.batchNumber,
      productId: entity.productId,
      productName: entity.productName,
      productionId: entity.productionId,
      harvestId: entity.harvestId,
      initialQuantity: entity.initialQuantity,
      quantitySold: entity.quantitySold,
      quantityRemaining: entity.quantityRemaining,
      quantityLost: entity.quantityLost,
      quantityReserved: entity.quantityReserved,
      soldPercentage: entity.soldPercentage,
      lossPercentage: entity.lossPercentage,
      totalCost: entity.totalCost,
      costPerUnit: entity.costPerUnit,
      productionCost: entity.productionCost,
      harvestCost: entity.harvestCost,
      processingCost: entity.processingCost,
      storageCost: entity.storageCost,
      totalRevenue: entity.totalRevenue,
      totalProfit: entity.totalProfit,
      profitMargin: entity.profitMargin,
      averageSalePrice: entity.averageSalePrice,
      numberOfSales: entity.numberOfSales,
      daysInStock: entity.daysInStock,
      turnoverRate: entity.turnoverRate,
      roi: entity.roi,
      quality: entity.quality,
      grade: entity.grade,
      isActive: entity.isActive,
      isSoldOut: entity.isSoldOut,
      isExpired: entity.isExpired,
      periodStart: entity.periodStart,
      periodEnd: entity.periodEnd,
      paybackPeriod: entity.paybackPeriod,
      profitPerDay: entity.profitPerDay,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  BatchAnalyticsEntity toEntity() {
    return BatchAnalyticsEntity(
      id: id,
      userId: userId,
      batchId: batchId,
      batchNumber: batchNumber,
      productId: productId,
      productName: productName,
      productionId: productionId,
      harvestId: harvestId,
      initialQuantity: initialQuantity,
      quantitySold: quantitySold,
      quantityRemaining: quantityRemaining,
      quantityLost: quantityLost,
      quantityReserved: quantityReserved,
      soldPercentage: soldPercentage,
      lossPercentage: lossPercentage,
      totalCost: totalCost,
      costPerUnit: costPerUnit,
      productionCost: productionCost,
      harvestCost: harvestCost,
      processingCost: processingCost,
      storageCost: storageCost,
      totalRevenue: totalRevenue,
      totalProfit: totalProfit,
      profitMargin: profitMargin,
      averageSalePrice: averageSalePrice,
      numberOfSales: numberOfSales,
      daysInStock: daysInStock,
      turnoverRate: turnoverRate,
      roi: roi,
      quality: quality,
      grade: grade,
      isActive: isActive,
      isSoldOut: isSoldOut,
      isExpired: isExpired,
      periodStart: periodStart,
      periodEnd: periodEnd,
      paybackPeriod: paybackPeriod,
      profitPerDay: profitPerDay,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
