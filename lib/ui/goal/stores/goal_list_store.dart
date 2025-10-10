import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/entities/goal_entity.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/goal/get_goals_usecase.dart';
import 'package:fiap_farms/utils/result.dart';

part 'goal_list_store.g.dart';

class GoalListStore = _GoalListStore with _$GoalListStore;

abstract class _GoalListStore with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetGoalsUseCase _getGoalsUseCase;

  _GoalListStore(
    this._getCurrentUserUseCase,
    this._getGoalsUseCase,
  );

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<GoalEntity> goals = ObservableList<GoalEntity>();

  @action
  Future<void> fetchGoals() async {
    isLoading = true;
    errorMessage = null;

    try {
      final currentUserResult = await _getCurrentUserUseCase();

      UserEntity? user;
      switch (currentUserResult) {
        case Ok(value: final userValue):
          user = userValue;
        case Error(error: final error):
          runInAction(() {
            errorMessage = error.toString();
          });
          return;
      }

      if (user == null || user.id == null) {
        runInAction(() {
          errorMessage = 'Usuário não autenticado';
        });
        return;
      }

      final result = await _getGoalsUseCase(user.id!);

      runInAction(() {
        switch (result) {
          case Ok(value: final goalsList):
            goals = ObservableList.of(goalsList);
          case Error(error: final error):
            errorMessage = error.toString();
        }
      });
    } finally {
      runInAction(() {
        isLoading = false;
      });
    }
  }
}
