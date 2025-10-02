class Sale {
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

  Sale({
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
}
