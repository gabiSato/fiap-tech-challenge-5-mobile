enum ProductCategory { vegetables, fruits, grains, dairy, meat, other }

enum ProductUnit { kg, unit, liter, bunch }

class ProductEntity {
  final String? id;
  final String userId;
  final String name;
  final ProductCategory category;
  final ProductUnit unit;
  final double pricePerUnit;
  final String? description;
  final String? imageUrl;
  final double currentStock;
  final double? minStockLevel;
  final double? maxStockLevel;
  final double? averageCost;
  final double? suggestedPrice;
  final String? variety;
  final String? origin;
  final int? shelfLife;
  final String? storageConditions;
  final bool? isOrganic;
  final List<String>? certifications;
  final String? gradeQuality;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductEntity({
    required this.userId,
    required this.name,
    required this.category,
    required this.unit,
    required this.pricePerUnit,
    required this.currentStock,
    this.id,
    this.description,
    this.imageUrl,
    this.minStockLevel,
    this.maxStockLevel,
    this.averageCost,
    this.suggestedPrice,
    this.variety,
    this.origin,
    this.shelfLife,
    this.storageConditions,
    this.isOrganic,
    this.certifications,
    this.gradeQuality,
    this.createdAt,
    this.updatedAt,
  });

  ProductEntity copyWith({
    String? id,
    String? userId,
    String? name,
    ProductCategory? category,
    ProductUnit? unit,
    double? pricePerUnit,
    String? description,
    String? imageUrl,
    double? currentStock,
    double? minStockLevel,
    double? maxStockLevel,
    double? averageCost,
    double? suggestedPrice,
    String? variety,
    String? origin,
    int? shelfLife,
    String? storageConditions,
    bool? isOrganic,
    List<String>? certifications,
    String? gradeQuality,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      pricePerUnit: pricePerUnit ?? this.pricePerUnit,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      currentStock: currentStock ?? this.currentStock,
      minStockLevel: minStockLevel ?? this.minStockLevel,
      maxStockLevel: maxStockLevel ?? this.maxStockLevel,
      averageCost: averageCost ?? this.averageCost,
      suggestedPrice: suggestedPrice ?? this.suggestedPrice,
      variety: variety ?? this.variety,
      origin: origin ?? this.origin,
      shelfLife: shelfLife ?? this.shelfLife,
      storageConditions: storageConditions ?? this.storageConditions,
      isOrganic: isOrganic ?? this.isOrganic,
      certifications: certifications ?? this.certifications,
      gradeQuality: gradeQuality ?? this.gradeQuality,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}