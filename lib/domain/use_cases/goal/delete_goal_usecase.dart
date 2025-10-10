import 'package:fiap_farms/domain/repositories/goal_repository.dart';
import 'package:fiap_farms/utils/result.dart';

class DeleteGoalUseCase {
  final GoalRepository _goalRepository;

  DeleteGoalUseCase(this._goalRepository);

  Future<Result<void>> call(String goalId) {
    return _goalRepository.deleteGoal(goalId);
  }
}
