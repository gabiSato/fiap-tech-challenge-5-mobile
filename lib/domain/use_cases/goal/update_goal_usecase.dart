import 'package:fiap_farms/domain/repositories/goal_repository.dart';
import 'package:fiap_farms/domain/entities/goal_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class UpdateGoalUseCase {
  final GoalRepository _goalRepository;

  UpdateGoalUseCase(this._goalRepository);

  Future<Result<void>> call(GoalEntity goal) {
    return _goalRepository.updateGoal(goal);
  }
}
