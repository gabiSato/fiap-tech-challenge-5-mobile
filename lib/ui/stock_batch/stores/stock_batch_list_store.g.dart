// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_batch_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StockBatchListStore on _StockBatchListStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_StockBatchListStore.isLoading',
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
    name: '_StockBatchListStore.errorMessage',
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

  late final _$stockBatchesAtom = Atom(
    name: '_StockBatchListStore.stockBatches',
    context: context,
  );

  @override
  ObservableList<StockBatchEntity> get stockBatches {
    _$stockBatchesAtom.reportRead();
    return super.stockBatches;
  }

  @override
  set stockBatches(ObservableList<StockBatchEntity> value) {
    _$stockBatchesAtom.reportWrite(value, super.stockBatches, () {
      super.stockBatches = value;
    });
  }

  late final _$fetchStockBatchesAsyncAction = AsyncAction(
    '_StockBatchListStore.fetchStockBatches',
    context: context,
  );

  @override
  Future<void> fetchStockBatches() {
    return _$fetchStockBatchesAsyncAction.run(() => super.fetchStockBatches());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
stockBatches: ${stockBatches}
    ''';
  }
}
