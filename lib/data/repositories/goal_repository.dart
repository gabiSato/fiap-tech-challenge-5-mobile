import 'package:fiap_farms/domain/repositories/goal_repository.dart';
import 'package:fiap_farms/domain/entities/goal_entity.dart';

import 'package:fiap_farms/data/sources/goal_service.dart';
import 'package:fiap_farms/data/models/goal_model.dart';

import 'package:fiap_farms/utils/result.dart';

class GoalRepositoryImpl implements GoalRepository {
  final GoalService _goalService;

  GoalRepositoryImpl(this._goalService);

  @override
  Future<Result<void>> createGoal(GoalEntity goal) {
    final goalModel = GoalModel.fromEntity(goal);
    return _goalService.createGoal(goalModel);
  }

  @override
  Future<Result<void>> deleteGoal(String goalId) {
    return _goalService.deleteGoal(goalId);
  }

  @override
  Future<Result<List<GoalEntity>>> getAllGoals(String userId) async {
    final result = await _goalService.getAllGoals(userId);

    return switch (result) {
      Ok(value: final models) => Result.ok(
        models.map((model) => model.toEntity()).toList(),
      ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<GoalEntity>> getGoal(String goalId) async {
    final result = await _goalService.getGoal(goalId);

    return switch (result) {
      Ok(value: final model) => Result.ok(model.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<void>> updateGoal(GoalEntity goal) {
    final goalModel = GoalModel.fromEntity(goal);
    return _goalService.updateGoal(goalModel);
  }
}
