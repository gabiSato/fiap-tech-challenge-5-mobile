class ProductionEntity {
  final String? id;
  final String userId;
  final String productId;
  final String status;
  final double quantityPlanted;
  final DateTime startDate;
  final double? quantityHarvested;
  final DateTime? harvestDate;

  ProductionEntity({
    this.id,
    required this.userId,
    required this.productId,
    required this.status,
    required this.quantityPlanted,
    required this.startDate,
    this.quantityHarvested,
    this.harvestDate,
  });
}
