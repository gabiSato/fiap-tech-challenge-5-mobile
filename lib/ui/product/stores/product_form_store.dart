import 'package:fiap_farms/utils/result.dart';
import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/create_product_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/update_product_usecase.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

part 'product_form_store.g.dart';

class ProductFormStore = _ProductFormStore with _$ProductFormStore;

abstract class _ProductFormStore with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final CreateProductUseCase _createProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;

  _ProductFormStore(
    this._getCurrentUserUseCase,
    this._createProductUseCase,
    this._updateProductUseCase,
  ) {
    _setupValidations();
  }

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  String name = '';

  @observable
  String unitOfMeasure = '';

  @observable
  bool isSaved = false;

  @observable
  String? nameError;

  @observable
  String? unitOfMeasureError;

  ProductEntity? _product;
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => name, (value) {
        if (nameError != null) {
          validateName(value);
        }
      }),
      reaction((_) => unitOfMeasure, (value) {
        if (unitOfMeasureError != null) {
          validateUnitOfMeasure(value);
        }
      }),
    ];
  }

  void setProduct(ProductEntity? product) {
    _product = product;
    if (product != null) {
      name = product.name;
      unitOfMeasure = product.unitOfMeasure;
    }
  }

  @action
  void setName(String value) => name = value;

  @action
  void setUnitOfMeasure(String value) => unitOfMeasure = value;

  @action
  void validateName(String value) {
    if (value.isEmpty) {
      nameError = 'Nome do produto é obrigatório';
    } else {
      nameError = null;
    }
  }

  @action
  void validateUnitOfMeasure(String value) {
    if (value.isEmpty) {
      unitOfMeasureError = 'Unidade de medida é obrigatória';
    } else {
      unitOfMeasureError = null;
    }
  }

  @action
  bool validateAll() {
    validateName(name);
    validateUnitOfMeasure(unitOfMeasure);

    return nameError == null && unitOfMeasureError == null;
  }

  @action
  Future<void> saveProduct() async {
    if (!validateAll()) {
      isLoading = false;
      return;
    }

    isLoading = true;
    errorMessage = null;
    isSaved = false;

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
        errorMessage = 'Usuário não encontrado';
        return;
      }

      final product = ProductEntity(
        id: _product?.id,
        userId: user.id!,
        name: name,
        unitOfMeasure: unitOfMeasure,
        quantity: _product == null ? 0.0 : _product!.quantity,
      );

      final result = _product == null
          ? await _createProductUseCase(product)
          : await _updateProductUseCase(product);

      runInAction(() {
        switch (result) {
          case Ok(value: _):
            isSaved = true;
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

  void dispose() {
    for (final dispose in _disposers) {
      dispose();
    }
  }
}
