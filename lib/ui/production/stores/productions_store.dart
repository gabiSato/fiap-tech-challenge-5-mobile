import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/use_cases/production/get_productions_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/get_product_usecase.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/domain/entities/production_status.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/utils/result.dart';

part 'productions_store.g.dart';

class ProductionsStore = _ProductionsStore with _$ProductionsStore;

abstract class _ProductionsStore with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetProductUseCase _getProductUseCase;
  final GetProductionsUseCase _getProductionsUseCase;

  _ProductionsStore(
    this._getCurrentUserUseCase,
    this._getProductUseCase,
    this._getProductionsUseCase,
  );

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<ProductionEntity> productions =
      ObservableList<ProductionEntity>();

  @observable
  ObservableMap<String, ProductEntity> products =
      ObservableMap<String, ProductEntity>();

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
    return productions.where((p) => p.status == selectedStatus!.name).toList();
  }

  @action
  Future<void> fetchProductions() async {
    isLoading = true;
    errorMessage = null;
    try {
      final userResult = await _getCurrentUserUseCase();
      UserEntity? user;
      switch (userResult) {
        case Ok(value: final userValue):
          user = userValue;
        case Error(error: _):
          user = null;
      }

      if (user == null || user.id == null) {
        return;
      }

      final result = await _getProductionsUseCase(user.id!);

      runInAction(() {
        switch (result) {
          case Ok(value: final newProductions):
            productions.clear();
            productions.addAll(newProductions);
            for (var production in newProductions) {
              _fetchProduct(production.productId);
            }
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

  @action
  Future<void> _fetchProduct(String productId) async {
    if (products.containsKey(productId)) {
      return;
    }
    final result = await _getProductUseCase(productId);

    runInAction(() {
      switch (result) {
        case Ok(value: final product):
          products[productId] = product;
        case Error(error: _):
          errorMessage = result.error.toString();
      }
    });
  }
}
