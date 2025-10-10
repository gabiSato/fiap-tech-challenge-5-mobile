import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/get_products_usecase.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/utils/result.dart';

part 'product_list_store.g.dart';

class ProductListStore = _ProductListStore with _$ProductListStore;

abstract class _ProductListStore with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetProductsUseCase _getProductsUseCase;

  _ProductListStore(this._getCurrentUserUseCase, this._getProductsUseCase);

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<ProductEntity> products = ObservableList<ProductEntity>();

  @action
  Future<void> fetchProducts() async {
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

      final result = await _getProductsUseCase(user.id!);

      runInAction(() {
        switch (result) {
          case Ok(value: final productList):
            products.clear();
            products.addAll(productList);
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
