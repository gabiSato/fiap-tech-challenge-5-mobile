import 'package:fiap_farms/domain/entities/goal_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class GoalRepository {
  Future<Result<GoalEntity>> getGoal(String goalId);
  Future<Result<void>> createGoal(GoalEntity goal);
  Future<Result<void>> updateGoal(GoalEntity goal);
  Future<Result<void>> deleteGoal(String goalId);
  Future<Result<List<GoalEntity>>> getAllGoals(String userId);
}
