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
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors => (_$hasErrorsComputed ??= Computed<bool>(
    () => super.hasErrors,
    name: '_ProductionFormStore.hasErrors',
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

  late final _$quantityPlantedAtom = Atom(
    name: '_ProductionFormStore.quantityPlanted',
    context: context,
  );

  @override
  String? get quantityPlanted {
    _$quantityPlantedAtom.reportRead();
    return super.quantityPlanted;
  }

  @override
  set quantityPlanted(String? value) {
    _$quantityPlantedAtom.reportWrite(value, super.quantityPlanted, () {
      super.quantityPlanted = value;
    });
  }

  late final _$expectedHarvestDateAtom = Atom(
    name: '_ProductionFormStore.expectedHarvestDate',
    context: context,
  );

  @override
  DateTime? get expectedHarvestDate {
    _$expectedHarvestDateAtom.reportRead();
    return super.expectedHarvestDate;
  }

  @override
  set expectedHarvestDate(DateTime? value) {
    _$expectedHarvestDateAtom.reportWrite(value, super.expectedHarvestDate, () {
      super.expectedHarvestDate = value;
    });
  }

  late final _$seedCostAtom = Atom(
    name: '_ProductionFormStore.seedCost',
    context: context,
  );

  @override
  String? get seedCost {
    _$seedCostAtom.reportRead();
    return super.seedCost;
  }

  @override
  set seedCost(String? value) {
    _$seedCostAtom.reportWrite(value, super.seedCost, () {
      super.seedCost = value;
    });
  }

  late final _$laborCostAtom = Atom(
    name: '_ProductionFormStore.laborCost',
    context: context,
  );

  @override
  String? get laborCost {
    _$laborCostAtom.reportRead();
    return super.laborCost;
  }

  @override
  set laborCost(String? value) {
    _$laborCostAtom.reportWrite(value, super.laborCost, () {
      super.laborCost = value;
    });
  }

  late final _$fertilizerCostAtom = Atom(
    name: '_ProductionFormStore.fertilizerCost',
    context: context,
  );

  @override
  String? get fertilizerCost {
    _$fertilizerCostAtom.reportRead();
    return super.fertilizerCost;
  }

  @override
  set fertilizerCost(String? value) {
    _$fertilizerCostAtom.reportWrite(value, super.fertilizerCost, () {
      super.fertilizerCost = value;
    });
  }

  late final _$irrigationCostAtom = Atom(
    name: '_ProductionFormStore.irrigationCost',
    context: context,
  );

  @override
  String? get irrigationCost {
    _$irrigationCostAtom.reportRead();
    return super.irrigationCost;
  }

  @override
  set irrigationCost(String? value) {
    _$irrigationCostAtom.reportWrite(value, super.irrigationCost, () {
      super.irrigationCost = value;
    });
  }

  late final _$otherCostsAtom = Atom(
    name: '_ProductionFormStore.otherCosts',
    context: context,
  );

  @override
  String? get otherCosts {
    _$otherCostsAtom.reportRead();
    return super.otherCosts;
  }

  @override
  set otherCosts(String? value) {
    _$otherCostsAtom.reportWrite(value, super.otherCosts, () {
      super.otherCosts = value;
    });
  }

  late final _$areaPlantedAtom = Atom(
    name: '_ProductionFormStore.areaPlanted',
    context: context,
  );

  @override
  String? get areaPlanted {
    _$areaPlantedAtom.reportRead();
    return super.areaPlanted;
  }

  @override
  set areaPlanted(String? value) {
    _$areaPlantedAtom.reportWrite(value, super.areaPlanted, () {
      super.areaPlanted = value;
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

  late final _$plotLocationAtom = Atom(
    name: '_ProductionFormStore.plotLocation',
    context: context,
  );

  @override
  String? get plotLocation {
    _$plotLocationAtom.reportRead();
    return super.plotLocation;
  }

  @override
  set plotLocation(String? value) {
    _$plotLocationAtom.reportWrite(value, super.plotLocation, () {
      super.plotLocation = value;
    });
  }

  late final _$varietyNameAtom = Atom(
    name: '_ProductionFormStore.varietyName',
    context: context,
  );

  @override
  String? get varietyName {
    _$varietyNameAtom.reportRead();
    return super.varietyName;
  }

  @override
  set varietyName(String? value) {
    _$varietyNameAtom.reportWrite(value, super.varietyName, () {
      super.varietyName = value;
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

  late final _$expectedYieldPerAreaAtom = Atom(
    name: '_ProductionFormStore.expectedYieldPerArea',
    context: context,
  );

  @override
  String? get expectedYieldPerArea {
    _$expectedYieldPerAreaAtom.reportRead();
    return super.expectedYieldPerArea;
  }

  @override
  set expectedYieldPerArea(String? value) {
    _$expectedYieldPerAreaAtom.reportWrite(
      value,
      super.expectedYieldPerArea,
      () {
        super.expectedYieldPerArea = value;
      },
    );
  }

  late final _$notesAtom = Atom(
    name: '_ProductionFormStore.notes',
    context: context,
  );

  @override
  String? get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(String? value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$productErrorAtom = Atom(
    name: '_ProductionFormStore.productError',
    context: context,
  );

  @override
  String? get productError {
    _$productErrorAtom.reportRead();
    return super.productError;
  }

  @override
  set productError(String? value) {
    _$productErrorAtom.reportWrite(value, super.productError, () {
      super.productError = value;
    });
  }

  late final _$quantityErrorAtom = Atom(
    name: '_ProductionFormStore.quantityError',
    context: context,
  );

  @override
  String? get quantityError {
    _$quantityErrorAtom.reportRead();
    return super.quantityError;
  }

  @override
  set quantityError(String? value) {
    _$quantityErrorAtom.reportWrite(value, super.quantityError, () {
      super.quantityError = value;
    });
  }

  late final _$expectedHarvestDateErrorAtom = Atom(
    name: '_ProductionFormStore.expectedHarvestDateError',
    context: context,
  );

  @override
  String? get expectedHarvestDateError {
    _$expectedHarvestDateErrorAtom.reportRead();
    return super.expectedHarvestDateError;
  }

  @override
  set expectedHarvestDateError(String? value) {
    _$expectedHarvestDateErrorAtom.reportWrite(
      value,
      super.expectedHarvestDateError,
      () {
        super.expectedHarvestDateError = value;
      },
    );
  }

  late final _$areaPlantedErrorAtom = Atom(
    name: '_ProductionFormStore.areaPlantedError',
    context: context,
  );

  @override
  String? get areaPlantedError {
    _$areaPlantedErrorAtom.reportRead();
    return super.areaPlantedError;
  }

  @override
  set areaPlantedError(String? value) {
    _$areaPlantedErrorAtom.reportWrite(value, super.areaPlantedError, () {
      super.areaPlantedError = value;
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
  void setQuantityPlanted(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setQuantityPlanted',
    );
    try {
      return super.setQuantityPlanted(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpectedHarvestDate(DateTime? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setExpectedHarvestDate',
    );
    try {
      return super.setExpectedHarvestDate(value);
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
  void setAreaPlanted(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setAreaPlanted',
    );
    try {
      return super.setAreaPlanted(value);
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
  void setPlotLocation(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setPlotLocation',
    );
    try {
      return super.setPlotLocation(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVarietyName(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setVarietyName',
    );
    try {
      return super.setVarietyName(value);
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
  void setExpectedYieldPerArea(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setExpectedYieldPerArea',
    );
    try {
      return super.setExpectedYieldPerArea(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotes(String value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.setNotes',
    );
    try {
      return super.setNotes(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateProduct(ProductEntity? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.validateProduct',
    );
    try {
      return super.validateProduct(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateQuantity(String? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.validateQuantity',
    );
    try {
      return super.validateQuantity(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateExpectedHarvestDate(DateTime? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.validateExpectedHarvestDate',
    );
    try {
      return super.validateExpectedHarvestDate(value);
    } finally {
      _$_ProductionFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePlantedArea(String? value) {
    final _$actionInfo = _$_ProductionFormStoreActionController.startAction(
      name: '_ProductionFormStore.validatePlantedArea',
    );
    try {
      return super.validatePlantedArea(value);
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
quantityPlanted: ${quantityPlanted},
expectedHarvestDate: ${expectedHarvestDate},
seedCost: ${seedCost},
laborCost: ${laborCost},
fertilizerCost: ${fertilizerCost},
irrigationCost: ${irrigationCost},
otherCosts: ${otherCosts},
areaPlanted: ${areaPlanted},
areaUnit: ${areaUnit},
plotLocation: ${plotLocation},
varietyName: ${varietyName},
sowingMethod: ${sowingMethod},
expectedYieldPerArea: ${expectedYieldPerArea},
notes: ${notes},
productError: ${productError},
quantityError: ${quantityError},
expectedHarvestDateError: ${expectedHarvestDateError},
areaPlantedError: ${areaPlantedError},
totalCost: ${totalCost},
hasErrors: ${hasErrors}
    ''';
  }
}
