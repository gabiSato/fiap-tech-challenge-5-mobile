// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductFormStore on _ProductFormStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_ProductFormStore.isLoading',
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
    name: '_ProductFormStore.errorMessage',
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

  late final _$nameAtom = Atom(
    name: '_ProductFormStore.name',
    context: context,
  );

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$categoryAtom = Atom(
    name: '_ProductFormStore.category',
    context: context,
  );

  @override
  ProductCategory? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(ProductCategory? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$unitAtom = Atom(
    name: '_ProductFormStore.unit',
    context: context,
  );

  @override
  ProductUnit? get unit {
    _$unitAtom.reportRead();
    return super.unit;
  }

  @override
  set unit(ProductUnit? value) {
    _$unitAtom.reportWrite(value, super.unit, () {
      super.unit = value;
    });
  }

  late final _$pricePerUnitAtom = Atom(
    name: '_ProductFormStore.pricePerUnit',
    context: context,
  );

  @override
  String get pricePerUnit {
    _$pricePerUnitAtom.reportRead();
    return super.pricePerUnit;
  }

  @override
  set pricePerUnit(String value) {
    _$pricePerUnitAtom.reportWrite(value, super.pricePerUnit, () {
      super.pricePerUnit = value;
    });
  }

  late final _$isSavedAtom = Atom(
    name: '_ProductFormStore.isSaved',
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

  late final _$nameErrorAtom = Atom(
    name: '_ProductFormStore.nameError',
    context: context,
  );

  @override
  String? get nameError {
    _$nameErrorAtom.reportRead();
    return super.nameError;
  }

  @override
  set nameError(String? value) {
    _$nameErrorAtom.reportWrite(value, super.nameError, () {
      super.nameError = value;
    });
  }

  late final _$categoryErrorAtom = Atom(
    name: '_ProductFormStore.categoryError',
    context: context,
  );

  @override
  String? get categoryError {
    _$categoryErrorAtom.reportRead();
    return super.categoryError;
  }

  @override
  set categoryError(String? value) {
    _$categoryErrorAtom.reportWrite(value, super.categoryError, () {
      super.categoryError = value;
    });
  }

  late final _$unitErrorAtom = Atom(
    name: '_ProductFormStore.unitError',
    context: context,
  );

  @override
  String? get unitError {
    _$unitErrorAtom.reportRead();
    return super.unitError;
  }

  @override
  set unitError(String? value) {
    _$unitErrorAtom.reportWrite(value, super.unitError, () {
      super.unitError = value;
    });
  }

  late final _$pricePerUnitErrorAtom = Atom(
    name: '_ProductFormStore.pricePerUnitError',
    context: context,
  );

  @override
  String? get pricePerUnitError {
    _$pricePerUnitErrorAtom.reportRead();
    return super.pricePerUnitError;
  }

  @override
  set pricePerUnitError(String? value) {
    _$pricePerUnitErrorAtom.reportWrite(value, super.pricePerUnitError, () {
      super.pricePerUnitError = value;
    });
  }

  late final _$saveProductAsyncAction = AsyncAction(
    '_ProductFormStore.saveProduct',
    context: context,
  );

  @override
  Future<void> saveProduct() {
    return _$saveProductAsyncAction.run(() => super.saveProduct());
  }

  late final _$_ProductFormStoreActionController = ActionController(
    name: '_ProductFormStore',
    context: context,
  );

  @override
  void setName(String value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.setName',
    );
    try {
      return super.setName(value);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(ProductCategory? value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.setCategory',
    );
    try {
      return super.setCategory(value);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnit(ProductUnit? value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.setUnit',
    );
    try {
      return super.setUnit(value);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPricePerUnit(String value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.setPricePerUnit',
    );
    try {
      return super.setPricePerUnit(value);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(String value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.validateName',
    );
    try {
      return super.validateName(value);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCategory(ProductCategory? value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.validateCategory',
    );
    try {
      return super.validateCategory(value);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUnit(ProductUnit? value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.validateUnit',
    );
    try {
      return super.validateUnit(value);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePricePerUnit(String? value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.validatePricePerUnit',
    );
    try {
      return super.validatePricePerUnit(value);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateAll() {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.validateAll',
    );
    try {
      return super.validateAll();
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
name: ${name},
category: ${category},
unit: ${unit},
pricePerUnit: ${pricePerUnit},
isSaved: ${isSaved},
nameError: ${nameError},
categoryError: ${categoryError},
unitError: ${unitError},
pricePerUnitError: ${pricePerUnitError}
    ''';
  }
}
