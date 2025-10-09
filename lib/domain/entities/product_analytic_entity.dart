class ProductAnalyticEntity {
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

  ProductAnalyticEntity({
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
}
