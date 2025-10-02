import 'package:cloud_firestore/cloud_firestore.dart';

class SaleModel {
  final String? id;
  final String userId;
  final String productId;
  final DateTime? saleDate;
  final String clientName;
  final String productName;
  final int quantity;
  final String unitOfMeasure;
  final double costPrice;
  final double unitPrice;
  final double totalAmount;
  final double totalProfit;

  SaleModel({
    required this.id,
    required this.userId,
    required this.productId,
    this.saleDate,
    required this.clientName,
    required this.productName,
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
      saleDate: map['saleDate'] != null
          ? (map['saleDate'] as Timestamp).toDate()
          : null,
      clientName: map['clientName'] ?? '',
      productName: map['productName'] ?? '',
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
      'productName': productName,
      'quantity': quantity,
      'unitOfMeasure': unitOfMeasure,
      'costPrice': costPrice,
      'unitPrice': unitPrice,
      'totalAmount': totalAmount,
      'totalProfit': totalProfit,
    };
  }
}
