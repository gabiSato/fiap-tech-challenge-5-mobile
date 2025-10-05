class Production {
  final String? id;
  final String userId;
  final String productId;
  final String status;
  final double quantityPlanted;
  final double? quantityHarvested;
  final DateTime startDate;
  final DateTime? harvestDate;

  Production({
    this.id,
    required this.userId,
    required this.productId,
    required this.status,
    required this.quantityPlanted,
    this.quantityHarvested,
    required this.startDate,
    this.harvestDate,
  });
}
