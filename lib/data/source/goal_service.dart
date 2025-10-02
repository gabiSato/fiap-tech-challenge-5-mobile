import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/data/model/goal_model.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class GoalService {
  Future<Result<GoalModel>> getGoal(String goalId);
  Future<Result<void>> createGoal(GoalModel goal);
  Future<Result<void>> updateGoal(GoalModel goal);
  Future<Result<void>> deleteGoal(String goalId);
  Future<Result<List<GoalModel>>> getAllGoals(String userId);
}

class GoalServiceImpl implements GoalService {
  @override
  Future<Result<GoalModel>> getGoal(String goalId) async {
    try {
      final goalDoc = await FirebaseFirestore.instance
          .collection('goals')
          .doc(goalId)
          .get();

      if (!goalDoc.exists) {
        return Result.error(Exception('Goal not found'));
      }

      return Result.ok(GoalModel.fromMap(goalDoc.data()!, goalDoc.id));
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> createGoal(GoalModel goal) async {
    try {
      await FirebaseFirestore.instance.collection('goals').add(goal.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> updateGoal(GoalModel goal) async {
    try {
      await FirebaseFirestore.instance
          .collection('goals')
          .doc(goal.id)
          .update(goal.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> deleteGoal(String goalId) async {
    try {
      await FirebaseFirestore.instance.collection('goals').doc(goalId).delete();

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<GoalModel>>> getAllGoals(String userId) async {
    try {
      final goalDocs = await FirebaseFirestore.instance
          .collection('goals')
          .where('userId', isEqualTo: userId)
          .get();

      List<GoalModel> goals = goalDocs.docs
          .map((doc) => GoalModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(goals);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
