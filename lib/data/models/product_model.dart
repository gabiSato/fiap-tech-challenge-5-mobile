import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/domain/entities/product_entity.dart';

class ProductModel {
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

  ProductModel({
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

  factory ProductModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductModel(
      id: id,
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      category: ProductCategory.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => ProductCategory.other,
      ),
      unit: ProductUnit.values.firstWhere(
        (e) => e.name == map['unit'],
        orElse: () => ProductUnit.unit,
      ),
      pricePerUnit: (map['pricePerUnit'] ?? 0).toDouble(),
      description: map['description'],
      imageUrl: map['imageUrl'],
      currentStock: (map['currentStock'] ?? 0).toDouble(),
      minStockLevel: map['minStockLevel']?.toDouble(),
      maxStockLevel: map['maxStockLevel']?.toDouble(),
      averageCost: map['averageCost']?.toDouble(),
      suggestedPrice: map['suggestedPrice']?.toDouble(),
      variety: map['variety'],
      origin: map['origin'],
      shelfLife: map['shelfLife'],
      storageConditions: map['storageConditions'],
      isOrganic: map['isOrganic'],
      certifications: map['certifications'] != null
          ? List<String>.from(map['certifications'])
          : null,
      gradeQuality: map['gradeQuality'],
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
      'name': name,
      'category': category.name,
      'unit': unit.name,
      'pricePerUnit': pricePerUnit,
      'description': description,
      'imageUrl': imageUrl,
      'currentStock': currentStock,
      'minStockLevel': minStockLevel,
      'maxStockLevel': maxStockLevel,
      'averageCost': averageCost,
      'suggestedPrice': suggestedPrice,
      'variety': variety,
      'origin': origin,
      'shelfLife': shelfLife,
      'storageConditions': storageConditions,
      'isOrganic': isOrganic,
      'certifications': certifications,
      'gradeQuality': gradeQuality,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      category: entity.category,
      unit: entity.unit,
      pricePerUnit: entity.pricePerUnit,
      description: entity.description,
      imageUrl: entity.imageUrl,
      currentStock: entity.currentStock,
      minStockLevel: entity.minStockLevel,
      maxStockLevel: entity.maxStockLevel,
      averageCost: entity.averageCost,
      suggestedPrice: entity.suggestedPrice,
      variety: entity.variety,
      origin: entity.origin,
      shelfLife: entity.shelfLife,
      storageConditions: entity.storageConditions,
      isOrganic: entity.isOrganic,
      certifications: entity.certifications,
      gradeQuality: entity.gradeQuality,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      userId: userId,
      name: name,
      category: category,
      unit: unit,
      pricePerUnit: pricePerUnit,
      description: description,
      imageUrl: imageUrl,
      currentStock: currentStock,
      minStockLevel: minStockLevel,
      maxStockLevel: maxStockLevel,
      averageCost: averageCost,
      suggestedPrice: suggestedPrice,
      variety: variety,
      origin: origin,
      shelfLife: shelfLife,
      storageConditions: storageConditions,
      isOrganic: isOrganic,
      certifications: certifications,
      gradeQuality: gradeQuality,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
