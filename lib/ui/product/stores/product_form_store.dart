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
  ProductCategory? category;

  @observable
  ProductUnit? unit;

  @observable
  String pricePerUnit = '';

  @observable
  bool isSaved = false;

  @observable
  String? nameError;

  @observable
  String? categoryError;

  @observable
  String? unitError;

  @observable
  String? pricePerUnitError;

  ProductEntity? _product;
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => name, (value) {
        if (nameError != null) {
          validateName(value);
        }
      }),
      reaction((_) => category, (value) {
        if (categoryError != null) {
          validateCategory(value);
        }
      }),
      reaction((_) => unit, (value) {
        if (unitError != null) {
          validateUnit(value);
        }
      }),
      reaction((_) => pricePerUnit, (value) {
        if (pricePerUnitError != null) {
          validatePricePerUnit(value);
        }
      }),
    ];
  }

  void setProduct(ProductEntity? product) {
    _product = product;
    if (product != null) {
      name = product.name;
      category = product.category;
      unit = product.unit;
      pricePerUnit = product.pricePerUnit.toString();
    }
  }

  @action
  void setName(String value) => name = value;

  @action
  void setCategory(ProductCategory? value) => category = value;

  @action
  void setUnit(ProductUnit? value) => unit = value;

  @action
  void setPricePerUnit(String value) => pricePerUnit = value;

  @action
  void validateName(String value) {
    if (value.isEmpty) {
      nameError = 'Nome do produto é obrigatório';
    } else {
      nameError = null;
    }
  }

  @action
  void validateCategory(ProductCategory? value) {
    if (value == null) {
      categoryError = 'Categoria é obrigatória';
    } else {
      categoryError = null;
    }
  }

  @action
  void validateUnit(ProductUnit? value) {
    if (value == null) {
      unitError = 'Unidade é obrigatória';
    } else {
      unitError = null;
    }
  }

  @action
  void validatePricePerUnit(String value) {
    if (value.isEmpty) {
      pricePerUnitError = 'Preço por unidade é obrigatório';
    } else if (double.tryParse(value) == null) {
      pricePerUnitError = 'Preço inválido';
    } else {
      pricePerUnitError = null;
    }
  }

  @action
  bool validateAll() {
    validateName(name);
    validateCategory(category);
    validateUnit(unit);
    validatePricePerUnit(pricePerUnit);

    return nameError == null &&
        categoryError == null &&
        unitError == null &&
        pricePerUnitError == null;
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
        isLoading = false;
        return;
      }

      final product = ProductEntity(
        id: _product?.id,
        userId: user.id!,
        name: name,
        category: category!,
        unit: unit!,
        pricePerUnit: double.parse(pricePerUnit),
        currentStock: _product?.currentStock ?? 0.0,
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
