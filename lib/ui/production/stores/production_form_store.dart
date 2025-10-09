import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/entities/production_status.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/domain/entities/sowing_method.dart';
import 'package:fiap_farms/domain/entities/area_unit.dart';

import 'package:fiap_farms/domain/use_cases/production/create_production_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/get_products_usecase.dart';

import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/utils/field_validators.dart';
import 'package:fiap_farms/utils/parse_currency.dart';
import 'package:fiap_farms/utils/result.dart';

part 'production_form_store.g.dart';

class ProductionFormStore = _ProductionFormStore with _$ProductionFormStore;

abstract class _ProductionFormStore with Store {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetProductsUseCase _getProductsUseCase;
  final CreateProductionUseCase _createProductionUseCase;

  _ProductionFormStore(
    this._getCurrentUserUseCase,
    this._getProductsUseCase,
    this._createProductionUseCase,
  ) {
    _setupValidations();
  }

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  bool isSaved = false;

  @observable
  ObservableList<ProductEntity> products = ObservableList<ProductEntity>();

  @observable
  ProductEntity? product;

  @observable
  String? quantityPlanted;

  @observable
  DateTime? expectedHarvestDate;

  @observable
  String? seedCost;

  @observable
  String? laborCost;

  @observable
  String? fertilizerCost;

  @observable
  String? irrigationCost;

  @observable
  String? otherCosts;

  @observable
  String? areaPlanted;

  @observable
  AreaUnit? areaUnit;

  @observable
  String? plotLocation;

  @observable
  String? varietyName;

  @observable
  SowingMethod? sowingMethod;

  @observable
  String? expectedYieldPerArea;

  @observable
  String? notes;

  @observable
  String? productError;

  @observable
  String? quantityError;

  @observable
  String? expectedHarvestDateError;

  @observable
  String? areaPlantedError;

  late List<ReactionDisposer> _disposers;

  @computed
  double get totalCost =>
      (parseCurrency(seedCost ?? '0,0') ?? 0.0) +
      (parseCurrency(laborCost ?? '0,0') ?? 0.0) +
      (parseCurrency(fertilizerCost ?? '0,0') ?? 0.0) +
      (parseCurrency(irrigationCost ?? '0,0') ?? 0.0) +
      (parseCurrency(otherCosts ?? '0,0') ?? 0.0);

  @action
  void setProduct(ProductEntity? value) => product = value;

  @action
  void setQuantityPlanted(String value) => quantityPlanted = value;

  @action
  void setExpectedHarvestDate(DateTime? value) => expectedHarvestDate = value;

  @action
  void setSeedCost(String value) => seedCost = value;

  @action
  void setLaborCost(String value) => laborCost = value;

  @action
  void setFertilizerCost(String value) => fertilizerCost = value;

  @action
  void setIrrigationCost(String value) => irrigationCost = value;

  @action
  void setOtherCosts(String value) => otherCosts = value;

  @action
  void setAreaPlanted(String value) => areaPlanted = value;

  @action
  void setAreaUnit(AreaUnit? value) => areaUnit = value;

  @action
  void setPlotLocation(String value) => plotLocation = value;

  @action
  void setVarietyName(String value) => varietyName = value;

  @action
  void setSowingMethod(SowingMethod? value) => sowingMethod = value;

  @action
  void setExpectedYieldPerArea(String value) => expectedYieldPerArea = value;

  @action
  void setNotes(String value) => notes = value;

  void _setupValidations() {
    _disposers = [
      reaction((_) => product, (value) {
        if (productError != null) {
          validateProduct(value);
        }
      }),
      reaction((_) => quantityPlanted, (value) {
        if (quantityError != null) {
          validateQuantity(value);
        }
      }),
      reaction((_) => expectedHarvestDate, (value) {
        if (expectedHarvestDateError != null) {
          validateExpectedHarvestDate(value);
        }
      }),
      reaction((_) => areaPlanted, (value) {
        if (areaPlantedError != null) {
          validatePlantedArea(value);
        }
      }),
    ];
  }

  @action
  void validateProduct(ProductEntity? value) {
    productError = FieldValidators.required(value?.name);
  }

  @action
  void validateQuantity(String? value) {
    quantityError = FieldValidators.required(value);
    quantityError ??= FieldValidators.number(value);
  }

  @action
  void validateExpectedHarvestDate(DateTime? value) {
    expectedHarvestDateError = FieldValidators.date(value);
  }

  @action
  void validatePlantedArea(String? value) {
    areaPlantedError = FieldValidators.number(value);
  }

  void validateAll() {
    validateProduct(product);
    validateQuantity(quantityPlanted);
    validateExpectedHarvestDate(expectedHarvestDate);
    validatePlantedArea(areaPlanted);
  }

  @computed
  bool get hasErrors =>
      productError != null ||
      quantityError != null ||
      expectedHarvestDateError != null ||
      areaPlantedError != null;

  @action
  Future<void> fetchProducts() async {
    isLoading = true;
    errorMessage = null;
    final userResult = await _getCurrentUserUseCase();
    if (userResult case Error(error: final e)) {
      errorMessage = e.toString();
      isLoading = false;
      return;
    }

    final user = (userResult as Ok).value;
    if (user.id == null) {
      errorMessage = 'User not found';
      isLoading = false;
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
      isLoading = false;
    });
  }

  @action
  Future<void> saveProduction() async {
    validateAll();
    if (hasErrors) {
      return;
    }

    isLoading = true;
    errorMessage = null;
    isSaved = false;

    final userResult = await _getCurrentUserUseCase();
    UserEntity? user;
    if (userResult case Ok(value: final userValue)) {
      user = userValue;
    }

    if (user == null || user.id == null) {
      errorMessage = 'Usuário não encontrado';
      isLoading = false;
      return;
    }

    final productionEntity = ProductionEntity(
      userId: user.id!,
      productId: product!.id!,
      productName: product!.name,
      quantityPlanted: double.parse(quantityPlanted!),
      unit: product!.unit.name,
      status: ProductionStatus.waiting,
      plantingDate: DateTime.now(),
      expectedHarvestDate: expectedHarvestDate!,
      costPerUnit: totalCost / double.parse(quantityPlanted!),
      totalCost: totalCost,
      seedCost: parseCurrency(seedCost ?? '0,0'),
      laborCost: parseCurrency(laborCost ?? '0,0'),
      fertilizerCost: parseCurrency(fertilizerCost ?? '0,0'),
      irrigationCost: parseCurrency(irrigationCost ?? '0,0'),
      otherCosts: parseCurrency(otherCosts ?? '0,0'),
      areaPlanted: double.tryParse(areaPlanted ?? ''),
      areaUnit: areaUnit,
      plotLocation: plotLocation,
      varietyName: varietyName,
      sowingMethod: sowingMethod,
      expectedYieldPerArea: double.tryParse(expectedYieldPerArea ?? ''),
      notes: notes,
    );

    final result = await _createProductionUseCase(productionEntity);

    runInAction(() {
      switch (result) {
        case Ok():
          isSaved = true;
        case Error(error: final e):
          errorMessage = e.toString();
      }
      isLoading = false;
    });
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
