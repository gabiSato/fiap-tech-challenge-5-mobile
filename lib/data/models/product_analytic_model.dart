class ProductAnalyticModel {
  final String userId;
  final String productId;
  final String productName;
  final int totalSoldQuantity;
  final double totalRevenue;
  final double totalProfit;
  final DateTime? lastSaleDate;

  ProductAnalyticModel({
    required this.userId,
    required this.productId,
    required this.productName,
    required this.totalSoldQuantity,
    required this.totalRevenue,
    required this.totalProfit,
    this.lastSaleDate,
  });

  factory ProductAnalyticModel.fromMap(Map<String, dynamic> map) {
    return ProductAnalyticModel(
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      totalSoldQuantity: map['totalSoldQuantity'] ?? 0,
      totalRevenue: (map['totalRevenue'] ?? 0).toDouble(),
      totalProfit: (map['totalProfit'] ?? 0).toDouble(),
      lastSaleDate: map['lastSaleDate'] != null
          ? DateTime.tryParse(map['lastSaleDate'])
          : null,
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
      'lastSaleDate': lastSaleDate?.toIso8601String(),
    };
  }
}
