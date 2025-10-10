enum GoalType { sales, production }

enum GoalPeriod { daily, weekly, monthly, quarterly, yearly }

class GoalEntity {
  final String? id;
  final String userId;
  final GoalType type;
  final String title;
  final String? description;
  final double targetValue;
  final double currentValue;
  final String unit;
  final GoalPeriod period;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GoalEntity({
    required this.userId,
    required this.type,
    required this.title,
    required this.targetValue,
    required this.currentValue,
    required this.unit,
    required this.period,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
    this.id,
    this.description,
    this.createdAt,
    this.updatedAt,
  });
}
