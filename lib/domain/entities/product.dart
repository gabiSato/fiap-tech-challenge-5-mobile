class Product {
  final String? id;
  final String userId;
  final String name;
  final String unitOfMeasure;
  final double quantity;

  Product({
    this.id,
    required this.userId,
    required this.name,
    required this.unitOfMeasure,
    required this.quantity,
  });
}
