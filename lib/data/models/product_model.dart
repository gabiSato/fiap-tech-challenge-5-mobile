import 'package:fiap_farms/domain/entities/product_entity.dart';

class ProductModel {
  final String? id;
  final String userId;
  final String name;
  final String unitOfMeasure;
  final double quantity;

  ProductModel({
    this.id,
    required this.userId,
    required this.name,
    required this.unitOfMeasure,
    required this.quantity,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductModel(
      id: id,
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      unitOfMeasure: map['unitOfMeasure'] ?? '',
      quantity: (map['quantity'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'unitOfMeasure': unitOfMeasure,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      unitOfMeasure: entity.unitOfMeasure,
      quantity: entity.quantity,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      userId: userId,
      name: name,
      unitOfMeasure: unitOfMeasure,
      quantity: quantity,
    );
  }
}
