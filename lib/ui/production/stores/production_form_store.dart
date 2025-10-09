import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/domain/entities/sowing_method.dart';
import 'package:fiap_farms/domain/entities/area_unit.dart';

import 'package:fiap_farms/domain/use_cases/production/create_production_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/get_products_usecase.dart';

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
  );

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
  double? quantity;

  @observable
  DateTime? harvestDate;

  @observable
  double seedCost = 0.0;

  @observable
  double laborCost = 0.0;

  @observable
  double fertilizerCost = 0.0;

  @observable
  double irrigationCost = 0.0;

  @observable
  double otherCosts = 0.0;

  @observable
  double? plantedArea;

  @observable
  AreaUnit? areaUnit;

  @observable
  String? location;

  @observable
  String? cultivar;

  @observable
  SowingMethod? sowingMethod;

  @observable
  double? expectedProductivity;

  @observable
  String? observations;

  @computed
  double get totalCost =>
      seedCost + laborCost + fertilizerCost + irrigationCost + otherCosts;

  @action
  void setProduct(ProductEntity? value) => product = value;

  @action
  void setQuantity(String value) => quantity = double.tryParse(value);

  @action
  void setHarvestDate(DateTime? value) => harvestDate = value;

  @action
  void setSeedCost(String value) => seedCost = parseCurrency(value) ?? 0.0;

  @action
  void setLaborCost(String value) => laborCost = parseCurrency(value) ?? 0.0;

  @action
  void setFertilizerCost(String value) =>
      fertilizerCost = parseCurrency(value) ?? 0.0;

  @action
  void setIrrigationCost(String value) =>
      irrigationCost = parseCurrency(value) ?? 0.0;

  @action
  void setOtherCosts(String value) => otherCosts = parseCurrency(value) ?? 0.0;

  @action
  void setPlantedArea(String value) => plantedArea = double.tryParse(value);

  @action
  void setAreaUnit(AreaUnit? value) => areaUnit = value;

  @action
  void setLocation(String value) => location = value;

  @action
  void setCultivar(String value) => cultivar = value;

  @action
  void setSowingMethod(SowingMethod? value) => sowingMethod = value;

  @action
  void setExpectedProductivity(String value) =>
      expectedProductivity = double.tryParse(value);

  @action
  void setObservations(String value) => observations = value;

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
  Future<void> saveProduction() async {}
}
