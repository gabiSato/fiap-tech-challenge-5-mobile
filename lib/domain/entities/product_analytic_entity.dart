class ProductAnalyticEntity {
  final String userId;
  final String productId;
  final String productName;
  final double totalSoldQuantity;
  final double totalRevenue;
  final double totalProfit;
  final DateTime lastSaleDate;

  ProductAnalyticEntity({
    required this.userId,
    required this.productId,
    required this.productName,
    required this.totalSoldQuantity,
    required this.totalRevenue,
    required this.totalProfit,
    required this.lastSaleDate,
  });
}
