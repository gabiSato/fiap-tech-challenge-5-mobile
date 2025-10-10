import 'package:fiap_farms/domain/repositories/goal_repository.dart';
import 'package:fiap_farms/domain/entities/goal_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetGoalsUseCase {
  final GoalRepository _goalRepository;

  GetGoalsUseCase(this._goalRepository);

  Future<Result<List<GoalEntity>>> call(String userId) {
    return _goalRepository.getAllGoals(userId);
  }
}
