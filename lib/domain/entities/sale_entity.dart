import 'package:fiap_farms/domain/entities/sale_item_entity.dart';

enum SaleStatus { pending, completed, cancelled }

enum PaymentMethod {
  cash,
  debitCard,
  creditCard,
  pix,
  bankTransfer,
  check,
  other,
}

class SaleEntity {
  final String? id;
  final String? userId;
  final List<SaleItemEntity> items;
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

  SaleEntity({
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
}
