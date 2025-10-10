import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/entities/stock_batch_entity.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/stock_batch/get_stock_batches_usecase.dart';
import 'package:fiap_farms/utils/result.dart';

part 'stock_batch_list_store.g.dart';

class StockBatchListStore = _StockBatchListStore with _$StockBatchListStore;

abstract class _StockBatchListStore with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetStockBatchesUseCase _getStockBatchesUseCase;

  _StockBatchListStore(
    this._getCurrentUserUseCase,
    this._getStockBatchesUseCase,
  );

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<StockBatchEntity> stockBatches =
      ObservableList<StockBatchEntity>();

  @action
  Future<void> fetchStockBatches() async {
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

      final result = await _getStockBatchesUseCase(user.id!);

      runInAction(() {
        switch (result) {
          case Ok(value: final batches):
            stockBatches = ObservableList.of(batches);
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
