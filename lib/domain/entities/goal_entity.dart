class GoalEntity {
  final String? id;
  final String? productId;
  final String userId;
  final String type;
  final String description;
  final double targetValue;
  final double currentValue;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  GoalEntity({
    required this.userId,
    required this.type,
    required this.description,
    required this.targetValue,
    required this.currentValue,
    required this.startDate,
    required this.endDate,
    required this.status,
    this.id,
    this.productId,
  });
}
