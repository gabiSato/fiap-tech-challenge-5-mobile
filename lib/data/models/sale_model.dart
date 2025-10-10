import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/domain/entities/sale_entity.dart';

import 'package:fiap_farms/data/models/sale_item_model.dart';

class SaleModel {
  final String? id;
  final String? userId;
  final List<SaleItemModel> items;
  final double totalAmount;
  final double totalCost;
  final double totalProfit;
  final double profitMargin;
  final String? customerName;
  final String? customerContact;
  final String? customerEmail;
  final String? customerDocument;
  final PaymentMethod? paymentMethod;
  final bool isPaid;
  final DateTime? paymentDate;
  final String? deliveryAddress;
  final DateTime? deliveryDate;
  final double? deliveryFee;
  final SaleStatus status;
  final DateTime saleDate;
  final String? notes;
  final String? invoiceNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SaleModel({
    required this.items,
    required this.totalAmount,
    required this.totalCost,
    required this.totalProfit,
    required this.profitMargin,
    required this.isPaid,
    required this.status,
    required this.saleDate,
    this.id,
    this.userId,
    this.customerName,
    this.customerContact,
    this.customerEmail,
    this.customerDocument,
    this.paymentMethod,
    this.paymentDate,
    this.deliveryAddress,
    this.deliveryDate,
    this.deliveryFee,
    this.notes,
    this.invoiceNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory SaleModel.fromMap(Map<String, dynamic> map, String id) {
    return SaleModel(
      id: id,
      userId: map['userId'],
      items:
          (map['items'] as List<dynamic>?)
              ?.map((item) => SaleItemModel.fromMap(item))
              .toList() ??
          [],
      totalAmount: (map['totalAmount'] ?? 0).toDouble(),
      totalCost: (map['totalCost'] ?? 0).toDouble(),
      totalProfit: (map['totalProfit'] ?? 0).toDouble(),
      profitMargin: (map['profitMargin'] ?? 0).toDouble(),
      customerName: map['customerName'],
      customerContact: map['customerContact'],
      customerEmail: map['customerEmail'],
      customerDocument: map['customerDocument'],
      paymentMethod: map['paymentMethod'] != null
          ? PaymentMethod.values.firstWhere(
              (e) => e.name == map['paymentMethod'],
            )
          : null,
      isPaid: map['isPaid'] ?? false,
      paymentDate: map['paymentDate'] != null
          ? (map['paymentDate'] as Timestamp).toDate()
          : null,
      deliveryAddress: map['deliveryAddress'],
      deliveryDate: map['deliveryDate'] != null
          ? (map['deliveryDate'] as Timestamp).toDate()
          : null,
      deliveryFee: map['deliveryFee']?.toDouble(),
      status: SaleStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => SaleStatus.pending,
      ),
      saleDate: (map['saleDate'] as Timestamp).toDate(),
      notes: map['notes'],
      invoiceNumber: map['invoiceNumber'],
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
      'items': items.map((item) => item.toMap()).toList(),
      'totalAmount': totalAmount,
      'totalCost': totalCost,
      'totalProfit': totalProfit,
      'profitMargin': profitMargin,
      'customerName': customerName,
      'customerContact': customerContact,
      'customerEmail': customerEmail,
      'customerDocument': customerDocument,
      'paymentMethod': paymentMethod?.name,
      'isPaid': isPaid,
      'paymentDate': paymentDate != null
          ? Timestamp.fromDate(paymentDate!)
          : null,
      'deliveryAddress': deliveryAddress,
      'deliveryDate': deliveryDate != null
          ? Timestamp.fromDate(deliveryDate!)
          : null,
      'deliveryFee': deliveryFee,
      'status': status.name,
      'saleDate': Timestamp.fromDate(saleDate),
      'notes': notes,
      'invoiceNumber': invoiceNumber,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : Timestamp.now(),
      'updatedAt': Timestamp.now(),
    };
  }

  SaleEntity toEntity() {
    return SaleEntity(
      id: id,
      userId: userId,
      items: items.map((item) => item.toEntity()).toList(),
      totalAmount: totalAmount,
      totalCost: totalCost,
      totalProfit: totalProfit,
      profitMargin: profitMargin,
      customerName: customerName,
      customerContact: customerContact,
      customerEmail: customerEmail,
      customerDocument: customerDocument,
      paymentMethod: paymentMethod,
      isPaid: isPaid,
      paymentDate: paymentDate,
      deliveryAddress: deliveryAddress,
      deliveryDate: deliveryDate,
      deliveryFee: deliveryFee,
      status: status,
      saleDate: saleDate,
      notes: notes,
      invoiceNumber: invoiceNumber,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory SaleModel.fromEntity(SaleEntity sale) {
    return SaleModel(
      id: sale.id,
      userId: sale.userId,
      items: sale.items.map(SaleItemModel.fromEntity).toList(),
      totalAmount: sale.totalAmount,
      totalCost: sale.totalCost,
      totalProfit: sale.totalProfit,
      profitMargin: sale.profitMargin,
      customerName: sale.customerName,
      customerContact: sale.customerContact,
      customerEmail: sale.customerEmail,
      customerDocument: sale.customerDocument,
      paymentMethod: sale.paymentMethod,
      isPaid: sale.isPaid,
      paymentDate: sale.paymentDate,
      deliveryAddress: sale.deliveryAddress,
      deliveryDate: sale.deliveryDate,
      deliveryFee: sale.deliveryFee,
      status: sale.status,
      saleDate: sale.saleDate,
      notes: sale.notes,
      invoiceNumber: sale.invoiceNumber,
      createdAt: sale.createdAt,
      updatedAt: sale.updatedAt,
    );
  }
}
