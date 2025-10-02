import 'package:cloud_firestore/cloud_firestore.dart';

class GoalModel {
  final String? id;
  final String userId;
  final String? productId;
  final String type;
  final String description;
  final double targetValue;
  final double currentValue;
  final DateTime? startDate;
  final DateTime? endDate;
  final String status;

  GoalModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.type,
    required this.description,
    required this.targetValue,
    required this.currentValue,
    this.startDate,
    this.endDate,
    required this.status,
  });

  factory GoalModel.fromMap(Map<String, dynamic> map, String id) {
    return GoalModel(
      id: id,
      userId: map['userId'] ?? '',
      productId: map['productId'],
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      targetValue: map['targetValue'] ?? 0,
      currentValue: map['currentValue'] ?? 0,
      startDate: map['startDate'] != null
          ? (map['startDate'] as Timestamp).toDate()
          : null,
      endDate: map['endDate'] != null
          ? (map['endDate'] as Timestamp).toDate()
          : null,
      status: map['status'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
      'type': type,
      'description': description,
      'targetValue': targetValue,
      'currentValue': currentValue,
      'startDate': startDate,
      'endDate': endDate,
      'status': status,
    };
  }
}
