class ProductModel {
  final String? id;
  final String userId;
  final String name;
  final String unitOfMeasure;
  final double quantity;

  ProductModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.unitOfMeasure,
    required this.quantity,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data, String documentId) {
    return ProductModel(
      id: documentId,
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      unitOfMeasure: data['unitOfMeasure'] ?? '',
      quantity: (data['quantity'] ?? 0).toDouble(),
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
}
