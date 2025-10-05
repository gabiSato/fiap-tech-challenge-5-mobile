import 'package:fiap_farms/domain/repositories/sale_repository.dart';
import 'package:fiap_farms/domain/entities/sale_entity.dart';

import 'package:fiap_farms/data/sources/sale_service.dart';
import 'package:fiap_farms/data/models/sale_model.dart';

import 'package:fiap_farms/utils/result.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleService _saleService;

  SaleRepositoryImpl(this._saleService);

  @override
  Future<Result<SaleEnity>> getSale(String saleId) async {
    final result = await _saleService.getSale(saleId);

    return switch (result) {
      Ok(value: final model) => Result.ok(model.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<void>> createSale(SaleEnity sale) async {
    final saleModel = SaleModel.fromEntity(sale);
    return _saleService.createSale(saleModel);
  }

  @override
  Future<Result<void>> updateSale(SaleEnity sale) async {
    final saleModel = SaleModel.fromEntity(sale);
    return _saleService.updateSale(saleModel);
  }

  @override
  Future<Result<void>> deleteSale(String saleId) async {
    return _saleService.deleteSale(saleId);
  }

  @override
  Future<Result<List<SaleEnity>>> getAllSales(String userId) async {
    final result = await _saleService.getAllSales(userId);
    return switch (result) {
      Ok(value: final productionModels) => Result.ok(
        productionModels.map((model) => model.toEntity()).toList(),
      ),
      Error(error: final error) => Result.error(error),
    };
  }
}
