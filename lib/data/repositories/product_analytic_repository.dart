import 'package:fiap_farms/domain/repositories/product_analytic_repository.dart';
import 'package:fiap_farms/domain/entities/product_analytic_entity.dart';

import 'package:fiap_farms/data/sources/product_analytic_service.dart';
import 'package:fiap_farms/data/models/product_analytic_model.dart';

import 'package:fiap_farms/utils/result.dart';

class ProductAnalyticRepositoryImpl implements ProductAnalyticRepository {
  final ProductAnalyticService _productAnalyticService;

  ProductAnalyticRepositoryImpl(this._productAnalyticService);

  @override
  Future<Result<void>> createProductAnalytic(
    ProductAnalyticEntity productAnalytic,
  ) {
    final productAnalyticModel = ProductAnalyticModel.fromEntity(
      productAnalytic,
    );
    return _productAnalyticService.createProductAnalytic(productAnalyticModel);
  }

  @override
  Future<Result<void>> updateProductAnalytic(
    ProductAnalyticEntity productAnalytic,
  ) {
    final productAnalyticModel = ProductAnalyticModel.fromEntity(
      productAnalytic,
    );
    return _productAnalyticService.updateProductAnalytic(productAnalyticModel);
  }

  @override
  Future<Result<List<ProductAnalyticEntity>>> getProductsWithHighestProfit(
    String userId,
  ) async {
    final result = await _productAnalyticService.getProductsWithHighestProfit(
      userId,
    );

    return switch (result) {
      Ok(value: final productAnalyticModels) => Result.ok(
        productAnalyticModels.map((model) => model.toEntity()).toList(),
      ),
      Error(error: final error) => Result.error(error),
    };
  }
}
