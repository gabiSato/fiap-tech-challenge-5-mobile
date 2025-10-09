// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductionFormStore on _ProductionFormStore, Store {
  Computed<double>? _$totalCostComputed;

  @override
  double get totalCost => (_$totalCostComputed ??= Computed<double>(
    () => super.totalCost,
    name: '_ProductionFormStore.totalCost',
  )).value;

  late final _$isLoadingAtom = Atom(
    name: '_ProductionFormStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_ProductionFormStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isSavedAtom = Atom(
    name: '_ProductionFormStore.isSaved',
    context: context,
  );

  @override
  bool get isSaved {
    _$isSavedAtom.reportRead();
    return super.isSaved;
  }

  @override
  set isSaved(bool value) {
    _$isSavedAtom.reportWrite(value, super.isSaved, () {
      super.isSaved = value;
    });
  }

  late final _$productsAtom = Atom(
    name: '_ProductionFormStore.products',
    context: context,
  );

  @override
  ObservableList<ProductEntity> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductEntity> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$productAtom = Atom(
    name: '_ProductionFormStore.product',
    context: context,
  );

  @override
  ProductEntity? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ProductEntity? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$quantityAtom = Atom(
    name: '_ProductionFormStore.quantity',
    context: context,
  );

  @override
  double? get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(double? value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$harvestDateAtom = Atom(
    name: '_ProductionFormStore.harvestDate',
    context: context,
  );

  @override
  DateTime? get harvestDate {
    _$harvestDateAtom.reportRead();
    return super.harvestDate;
  }

  @override
  set harvestDate(DateTime? value) {
    _$harvestDateAtom.reportWrite(value, super.harvestDate, () {
      super.harvestDate = value;
    });
  }

  late final _$seedCostAtom = Atom(
    name: '_ProductionFormStore.seedCost',
    context: context,
  );

  @override
  double get seedCost {
    _$seedCostAtom.reportRead();
    return super.seedCost;
  }

  @override
  set seedCost(double value) {
    _$seedCostAtom.reportWrite(value, super.seedCost, () {
      super.seedCost = value;
    });
  }

  late final _$laborCostAtom = Atom(
    name: '_ProductionFormStore.laborCost',
    context: context,
  );

  @override
  double get laborCost {
    _$laborCostAtom.reportRead();
    return super.laborCost;
  }

  @override
  set laborCost(double value) {
    _$laborCostAtom.reportWrite(value, super.laborCost, () {
      super.laborCost = value;
    });
  }

  late final _$fertilizerCostAtom = Atom(
    name: '_ProductionFormStore.fertilizerCost',
    context: context,
  );

  @override
  double get fertilizerCost {
    _$fertilizerCostAtom.reportRead();
    return super.fertilizerCost;
  }

  @override
  set fertilizerCost(double value) {
    _$fertilizerCostAtom.reportWrite(value, super.fertilizerCost, () {
      super.fertilizerCost = value;
    });
  }

  late final _$irrigationCostAtom = Atom(
    name: '_ProductionFormStore.irrigationCost',
    context: context,
  );

  @override
  double get irrigationCost {
    _$irrigationCostAtom.reportRead();
    return super.irrigationCost;
  }

  @override
  set irrigationCost(double value) {
    _$irrigationCostAtom.reportWrite(value, super.irrigationCost, () {
      super.irrigationCost = value;
    });
  }

  late final _$otherCostsAtom = Atom(
    name: '_ProductionFormStore.otherCosts',
    context: context,
  );

  @override
  double get otherCosts {
    _$otherCostsAtom.reportRead();
    return super.otherCosts;
  }

  @override
  set otherCosts(double value) {
    _$otherCostsAtom.reportWrite(value, super.otherCosts, () {
      super.otherCosts = value;
    });
  }

  late final _$plantedAreaAtom = Atom(
    name: '_ProductionFormStore.plantedArea',
    context: context,
  );

  @override
  double? get plantedArea {
    _$plantedAreaAtom.reportRead();
    return super.plantedArea;
  }

  @override
  set plantedArea(double? value) {
    _$plantedAreaAtom.reportWrite(value, super.plantedArea, () {
      super.plantedArea = value;
    });
  }

  late final _$areaUnitAtom = Atom(
    name: '_ProductionFormStore.areaUnit',
    context: context,
  );

  @override
  AreaUnit? get areaUnit {
    _$areaUnitAtom.reportRead();
    return super.areaUnit;
  }

  @override
  set areaUnit(AreaUnit? value) {
    _$areaUnitAtom.reportWrite(value, super.areaUnit, () {
      super.areaUnit = value;
    });
  }

  late final _$locationAtom = Atom(
    name: '_ProductionFormStore.location',
    context: context,
  );

  @override
  String? get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(String? value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  late final _$cultivarAtom = Atom(
    name: '_ProductionFormStore.cultivar',
    context: context,
  );

  @override
  String? get cultivar {
    _$cultivarAtom.reportRead();
    return super.cultivar;
  }

  @override
  set cultivar(String? value) {
    _$cultivarAtom.reportWrite(value, super.cultivar, () {
      super.cultivar = value;
    });
  }

  late final _$sowingMethodAtom = Atom(
    name: '_ProductionFormStore.sowingMethod',
    context: context,
  );

  @override
  SowingMethod? get sowingMethod {
    _$sowingMethodAtom.reportRead();
    return super.sowingMethod;
  }

  @override
  set sowingMethod(SowingMethod? value) {
    _$sowingMethodAtom.reportWrite(value, super.sowingMethod, () {
      super.sowingMethod = value;
    });
  }

  late final _$expectedProductivityAtom = Atom(
    name: '_ProductionFormStore.expectedProductivity',
    context: context,
  );

  @override
  double? get expectedProductivity {
    _$expectedProductivityAtom.reportRead();
    return super.expectedProductivity;
  }

  @override
  set expectedProductivity(double? value) {
    _$expectedProductivityAtom.reportWrite(
      value,
      super.expectedProductivity,
      () {
        super.expectedProductivity = value;
      },
    );
  }

  late final _$observationsAtom = Atom(
    name: '_ProductionFormStore.observations',
    context: context,
  );

  @override
  String? get observations {
    _$observationsAtom.reportRead();
    return super.observations;
  }

  @override
  set observations(String? value) {
    _$observationsAtom.reportWrite(value, super.observations, () {
      super.observations = value;
    });
  }

  late final _$fetchProductsAsyncAction = AsyncAction(
    '_ProductionFormStore.fetchProducts',
    context: context,
  );

  @override
  Future<void> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  late final _$saveProductionAsyncAction = AsyncAction(
    '_ProductionFormStore.saveProduction',
    context: context,
  );

  @override
  Future<void> saveProduction() {
    return _$saveProductionAsyncAction.run(() => super.saveProduction());
  }

  late final _$_ProductionFormStoreActionController = ActionController(
    name: '_ProductionFormStore',
    context: context,
  );

  @override
  void setProduct(ProductEntity? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setProduct',
    );
    try {
      return super.setProduct(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setQuantity',
    );
    try {
      return super.setQuantity(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHarvestDate(DateTime? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setHarvestDate',
    );
    try {
      return super.setHarvestDate(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeedCost(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setSeedCost',
    );
    try {
      return super.setSeedCost(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLaborCost(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setLaborCost',
    );
    try {
      return super.setLaborCost(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFertilizerCost(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setFertilizerCost',
    );
    try {
      return super.setFertilizerCost(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIrrigationCost(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setIrrigationCost',
    );
    try {
      return super.setIrrigationCost(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOtherCosts(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setOtherCosts',
    );
    try {
      return super.setOtherCosts(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlantedArea(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setPlantedArea',
    );
    try {
      return super.setPlantedArea(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAreaUnit(AreaUnit? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setAreaUnit',
    );
    try {
      return super.setAreaUnit(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocation(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setLocation',
    );
    try {
      return super.setLocation(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCultivar(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setCultivar',
    );
    try {
      return super.setCultivar(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSowingMethod(SowingMethod? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setSowingMethod',
    );
    try {
      return super.setSowingMethod(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpectedProductivity(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setExpectedProductivity',
    );
    try {
      return super.setExpectedProductivity(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservations(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setObservations',
    );
    try {
      return super.setObservations(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isSaved: ${isSaved},
products: ${products},
product: ${product},
quantity: ${quantity},
harvestDate: ${harvestDate},
seedCost: ${seedCost},
laborCost: ${laborCost},
fertilizerCost: ${fertilizerCost},
irrigationCost: ${irrigationCost},
otherCosts: ${otherCosts},
plantedArea: ${plantedArea},
areaUnit: ${areaUnit},
location: ${location},
cultivar: ${cultivar},
sowingMethod: ${sowingMethod},
expectedProductivity: ${expectedProductivity},
observations: ${observations},
totalCost: ${totalCost}
    ''';
  }
}
