import 'package:fiap_farms/domain/repositories/goal_repository.dart';
import 'package:fiap_farms/domain/entities/goal_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class CreateGoalUseCase {
  final GoalRepository _goalRepository;

  CreateGoalUseCase(this._goalRepository);

  Future<Result<void>> call(GoalEntity goal) {
    return _goalRepository.createGoal(goal);
  }
}
