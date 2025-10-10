import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/domain/entities/quality_grade.dart';

class BatchAnalyticsEntity {
  final String? id;
  final String userId;

  // Identificação
  final String batchId;
  final String batchNumber;
  final String productId;
  final String productName;
  final String productionId;
  final String harvestId;

  // Quantidades
  final double initialQuantity;
  final double quantitySold;
  final double quantityRemaining;
  final double quantityLost;
  final double quantityReserved;

  // Percentuais
  final double soldPercentage;
  final double lossPercentage;

  // Custos
  final double totalCost;
  final double costPerUnit;
  final double productionCost;
  final double harvestCost;
  final double processingCost;
  final double storageCost;

  // Receitas e lucro
  final double totalRevenue;
  final double totalProfit;
  final double profitMargin; // %

  // Performance
  final double averageSalePrice;
  final int numberOfSales;
  final int daysInStock;
  final double turnoverRate; // Taxa de giro

  // ROI
  final double roi; // Retorno sobre investimento (%)
  final int? paybackPeriod; // Dias para recuperar investimento
  final double? profitPerDay;

  // Qualidade
  final HarvestQuality quality;
  final QualityGrade? grade;

  // Status
  final bool isActive;
  final bool isSoldOut;
  final bool isExpired;

  final DateTime periodStart;
  final DateTime periodEnd;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  BatchAnalyticsEntity({
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
}
