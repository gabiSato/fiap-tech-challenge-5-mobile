enum HarvestQuality { excellent, good, average, poor }

class HarvestEntity {
  final String? id;
  final String userId;
  final String productionId;
  final String productId;
  final String productName;
  final double quantityHarvested;
  final String unit;
  final double? quantityLost;
  final double? lossPercentage;
  final HarvestQuality quality;
  final DateTime harvestDate;
  final String? harvestStartTime;
  final String? harvestEndTime;
  final double? harvestCost;
  final double? laborCost;
  final double? equipmentCost;
  final double? transportCost;
  final String? weatherConditions;
  final double? temperature;
  final double? humidity;
  final int? workersCount;
  final double? hoursWorked;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  HarvestEntity({
    required this.userId,
    required this.productionId,
    required this.productId,
    required this.productName,
    required this.quantityHarvested,
    required this.unit,
    required this.quality,
    required this.harvestDate,
    this.id,
    this.quantityLost,
    this.lossPercentage,
    this.harvestStartTime,
    this.harvestEndTime,
    this.harvestCost,
    this.laborCost,
    this.equipmentCost,
    this.transportCost,
    this.weatherConditions,
    this.temperature,
    this.humidity,
    this.workersCount,
    this.hoursWorked,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });
}
