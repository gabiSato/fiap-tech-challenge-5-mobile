// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductFormStore on _ProductFormStore, Store {
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

  late final _$unitOfMeasureAtom = Atom(
    name: '_ProductFormStore.unitOfMeasure',
    context: context,
  );

  @override
  String get unitOfMeasure {
    _$unitOfMeasureAtom.reportRead();
    return super.unitOfMeasure;
  }

  @override
  set unitOfMeasure(String value) {
    _$unitOfMeasureAtom.reportWrite(value, super.unitOfMeasure, () {
      super.unitOfMeasure = value;
    });
  }

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

  late final _$unitOfMeasureErrorAtom = Atom(
    name: '_ProductFormStore.unitOfMeasureError',
    context: context,
  );

  @override
  String? get unitOfMeasureError {
    _$unitOfMeasureErrorAtom.reportRead();
    return super.unitOfMeasureError;
  }

  @override
  set unitOfMeasureError(String? value) {
    _$unitOfMeasureErrorAtom.reportWrite(value, super.unitOfMeasureError, () {
      super.unitOfMeasureError = value;
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
  void setUnitOfMeasure(String value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.setUnitOfMeasure',
    );
    try {
      return super.setUnitOfMeasure(value);
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
  void validateUnitOfMeasure(String value) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
      name: '_ProductFormStore.validateUnitOfMeasure',
    );
    try {
      return super.validateUnitOfMeasure(value);
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
name: ${name},
unitOfMeasure: ${unitOfMeasure},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isSaved: ${isSaved},
nameError: ${nameError},
unitOfMeasureError: ${unitOfMeasureError}
    ''';
  }
}
