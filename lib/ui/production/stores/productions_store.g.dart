// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductionsStore on _ProductionsStore, Store {
  Computed<List<ProductionEntity>>? _$filteredProductionsComputed;

  @override
  List<ProductionEntity> get filteredProductions =>
      (_$filteredProductionsComputed ??= Computed<List<ProductionEntity>>(
        () => super.filteredProductions,
        name: '_ProductionsStore.filteredProductions',
      )).value;

  late final _$isLoadingAtom = Atom(
    name: '_ProductionsStore.isLoading',
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
    name: '_ProductionsStore.errorMessage',
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

  late final _$productionsAtom = Atom(
    name: '_ProductionsStore.productions',
    context: context,
  );

  @override
  ObservableList<ProductionEntity> get productions {
    _$productionsAtom.reportRead();
    return super.productions;
  }

  @override
  set productions(ObservableList<ProductionEntity> value) {
    _$productionsAtom.reportWrite(value, super.productions, () {
      super.productions = value;
    });
  }

  late final _$productsAtom = Atom(
    name: '_ProductionsStore.products',
    context: context,
  );

  @override
  ObservableMap<String, ProductEntity> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableMap<String, ProductEntity> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$selectedStatusAtom = Atom(
    name: '_ProductionsStore.selectedStatus',
    context: context,
  );

  @override
  ProductionStatus? get selectedStatus {
    _$selectedStatusAtom.reportRead();
    return super.selectedStatus;
  }

  @override
  set selectedStatus(ProductionStatus? value) {
    _$selectedStatusAtom.reportWrite(value, super.selectedStatus, () {
      super.selectedStatus = value;
    });
  }

  late final _$fetchProductionsAsyncAction = AsyncAction(
    '_ProductionsStore.fetchProductions',
    context: context,
  );

  @override
  Future<void> fetchProductions() {
    return _$fetchProductionsAsyncAction.run(() => super.fetchProductions());
  }

  late final _$_fetchProductAsyncAction = AsyncAction(
    '_ProductionsStore._fetchProduct',
    context: context,
  );

  @override
  Future<void> _fetchProduct(String productId) {
    return _$_fetchProductAsyncAction.run(() => super._fetchProduct(productId));
  }

  late final _$_ProductionsStoreActionController = ActionController(
    name: '_ProductionsStore',
    context: context,
  );

  @override
  void setSelectedStatus(ProductionStatus? status) {
    final _$actionInfo = _$_ProductionsStoreActionController.startAction(
      name: '_ProductionsStore.setSelectedStatus',
    );
    try {
      return super.setSelectedStatus(status);
    } finally {
      _$_ProductionsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
productions: ${productions},
products: ${products},
selectedStatus: ${selectedStatus},
filteredProductions: ${filteredProductions}
    ''';
  }
}
