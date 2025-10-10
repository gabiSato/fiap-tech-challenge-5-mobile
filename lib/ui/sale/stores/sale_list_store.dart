import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/entities/sale_entity.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/sale/get_sales_usecase.dart';
import 'package:fiap_farms/utils/result.dart';

part 'sale_list_store.g.dart';

class SaleListStore = _SaleListStore with _$SaleListStore;

abstract class _SaleListStore with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetSalesUseCase _getSalesUseCase;

  _SaleListStore(
    this._getCurrentUserUseCase,
    this._getSalesUseCase,
  );

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<SaleEntity> sales = ObservableList<SaleEntity>();

  @action
  Future<void> fetchSales() async {
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

      final result = await _getSalesUseCase(user.id!);

      runInAction(() {
        switch (result) {
          case Ok(value: final salesList):
            sales = ObservableList.of(salesList);
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
