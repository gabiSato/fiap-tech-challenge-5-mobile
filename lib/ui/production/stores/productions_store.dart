import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/use_cases/production/get_productions_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/domain/entities/production_status.dart';
import 'package:fiap_farms/utils/result.dart';

part 'productions_store.g.dart';

class ProductionsStore = _ProductionsStore with _$ProductionsStore;

abstract class _ProductionsStore with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetProductionsUseCase _getProductionsUseCase;

  _ProductionsStore(this._getCurrentUserUseCase, this._getProductionsUseCase);

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<ProductionEntity> productions =
      ObservableList<ProductionEntity>();

  @observable
  ProductionStatus? selectedStatus;

  @action
  void setSelectedStatus(ProductionStatus? status) {
    selectedStatus = status;
  }

  @computed
  List<ProductionEntity> get filteredProductions {
    if (selectedStatus == null) {
      return productions;
    }
    return productions.where((p) => p.status == selectedStatus).toList();
  }

  @action
  Future<void> fetchProductions() async {
    isLoading = true;
    errorMessage = null;
    try {
      final userResult = await _getCurrentUserUseCase();
      if (userResult case Error(error: final e)) {
        errorMessage = e.toString();
        return;
      }

      final user = (userResult as Ok).value;
      if (user.id == null) {
        errorMessage = 'User not found';
        return;
      }

      final result = await _getProductionsUseCase(user.id!);

      switch (result) {
        case Ok(value: final newProductions):
          runInAction(() {
            productions.clear();
            productions.addAll(newProductions);
          });

        case Error(error: final error):
          errorMessage = error.toString();
      }
    } finally {
      isLoading = false;
    }
  }
}
