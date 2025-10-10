import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/domain/entities/goal_entity.dart';

class GoalModel {
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

  GoalModel({
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

  factory GoalModel.fromMap(Map<String, dynamic> map, String id) {
    return GoalModel(
      id: id,
      userId: map['userId'] ?? '',
      type: GoalType.values.firstWhere((e) => e.toString() == map['type']),
      title: map['title'] ?? '',
      description: map['description'],
      targetValue: (map['targetValue'] ?? 0).toDouble(),
      currentValue: (map['currentValue'] ?? 0).toDouble(),
      unit: map['unit'] ?? '',
      period: GoalPeriod.values.firstWhere(
        (e) => e.toString() == map['period'],
      ),
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate: (map['endDate'] as Timestamp).toDate(),
      isCompleted: map['isCompleted'] ?? false,
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
      'type': type.toString(),
      'title': title,
      'description': description,
      'targetValue': targetValue,
      'currentValue': currentValue,
      'unit': unit,
      'period': period.toString(),
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'isCompleted': isCompleted,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : Timestamp.now(),
      'updatedAt': Timestamp.now(),
    };
  }

  factory GoalModel.fromEntity(GoalEntity entity) {
    return GoalModel(
      id: entity.id,
      userId: entity.userId,
      type: entity.type,
      title: entity.title,
      description: entity.description,
      targetValue: entity.targetValue,
      currentValue: entity.currentValue,
      unit: entity.unit,
      period: entity.period,
      startDate: entity.startDate,
      endDate: entity.endDate,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  GoalEntity toEntity() {
    return GoalEntity(
      id: id,
      userId: userId,
      type: type,
      title: title,
      description: description,
      targetValue: targetValue,
      currentValue: currentValue,
      unit: unit,
      period: period,
      startDate: startDate,
      endDate: endDate,
      isCompleted: isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
