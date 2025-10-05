import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/domain/entities/sale_entity.dart';

class SaleModel {
  final String? id;
  final String userId;
  final String productId;
  final DateTime saleDate;
  final String clientName;
  final int quantity;
  final String unitOfMeasure;
  final double costPrice;
  final double unitPrice;
  final double totalAmount;
  final double totalProfit;

  SaleModel({
    this.id,
    required this.userId,
    required this.productId,
    required this.saleDate,
    required this.clientName,
    required this.quantity,
    required this.unitOfMeasure,
    required this.costPrice,
    required this.unitPrice,
    required this.totalAmount,
    required this.totalProfit,
  });

  factory SaleModel.fromMap(Map<String, dynamic> map, String id) {
    return SaleModel(
      id: id,
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      saleDate: (map['saleDate'] as Timestamp).toDate(),
      clientName: map['clientName'] ?? '',
      quantity: map['quantity'] ?? 0,
      unitOfMeasure: map['unitOfMeasure'] ?? '',
      costPrice: (map['costPrice'] ?? 0).toDouble(),
      unitPrice: (map['unitPrice'] ?? 0).toDouble(),
      totalAmount: (map['totalAmount'] ?? 0).toDouble(),
      totalProfit: (map['totalProfit'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
      'saleDate': saleDate,
      'clientName': clientName,
      'quantity': quantity,
      'unitOfMeasure': unitOfMeasure,
      'costPrice': costPrice,
      'unitPrice': unitPrice,
      'totalAmount': totalAmount,
      'totalProfit': totalProfit,
    };
  }

  SaleEnity toEntity() {
    return SaleEnity(
      id: id,
      userId: userId,
      productId: productId,
      saleDate: saleDate,
      clientName: clientName,
      quantity: quantity,
      unitOfMeasure: unitOfMeasure,
      costPrice: costPrice,
      unitPrice: unitPrice,
      totalAmount: totalAmount,
      totalProfit: totalProfit,
    );
  }

  factory SaleModel.fromEntity(SaleEnity sale) {
    return SaleModel(
      id: sale.id,
      userId: sale.userId,
      productId: sale.productId,
      saleDate: sale.saleDate,
      clientName: sale.clientName,
      quantity: sale.quantity,
      unitOfMeasure: sale.unitOfMeasure,
      costPrice: sale.costPrice,
      unitPrice: sale.unitPrice,
      totalAmount: sale.totalAmount,
      totalProfit: sale.totalProfit,
    );
  }
}
