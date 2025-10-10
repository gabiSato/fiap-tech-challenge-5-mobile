import 'package:fiap_farms/domain/entities/sale_item_entity.dart';

class SaleItemModel {
  final String productId;
  final String productName;
  final double quantity;
  final String unit;
  final double pricePerUnit;
  final double costPerUnit;
  final double totalPrice;
  final double totalCost;
  final double profit;

  SaleItemModel({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unit,
    required this.pricePerUnit,
    required this.costPerUnit,
    required this.totalPrice,
    required this.totalCost,
    required this.profit,
  });

  factory SaleItemModel.fromMap(Map<String, dynamic> map) {
    return SaleItemModel(
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      quantity: (map['quantity'] ?? 0).toDouble(),
      unit: map['unit'] ?? '',
      pricePerUnit: (map['pricePerUnit'] ?? 0).toDouble(),
      costPerUnit: (map['costPerUnit'] ?? 0).toDouble(),
      totalPrice: (map['totalPrice'] ?? 0).toDouble(),
      totalCost: (map['totalCost'] ?? 0).toDouble(),
      profit: (map['profit'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'unit': unit,
      'pricePerUnit': pricePerUnit,
      'costPerUnit': costPerUnit,
      'totalPrice': totalPrice,
      'totalCost': totalCost,
      'profit': profit,
    };
  }

  factory SaleItemModel.fromEntity(SaleItemEntity entity) {
    return SaleItemModel(
      productId: entity.productId,
      productName: entity.productName,
      quantity: entity.quantity,
      unit: entity.unit,
      pricePerUnit: entity.pricePerUnit,
      costPerUnit: entity.costPerUnit,
      totalPrice: entity.totalPrice,
      totalCost: entity.totalCost,
      profit: entity.profit,
    );
  }

  SaleItemEntity toEntity() {
    return SaleItemEntity(
      productId: productId,
      productName: productName,
      quantity: quantity,
      unit: unit,
      pricePerUnit: pricePerUnit,
      costPerUnit: costPerUnit,
      totalPrice: totalPrice,
      totalCost: totalCost,
      profit: profit,
    );
  }
}
