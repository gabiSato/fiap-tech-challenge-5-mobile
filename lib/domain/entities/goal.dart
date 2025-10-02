class Goal {
  final String? id;
  final String userId;
  final String? productId;
  final String type;
  final String description;
  final double targetValue;
  final double currentValue;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  Goal({
    this.id,
    required this.userId,
    this.productId,
    required this.type,
    required this.description,
    required this.targetValue,
    required this.currentValue,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}
