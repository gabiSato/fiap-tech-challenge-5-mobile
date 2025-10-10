import 'package:fiap_farms/domain/repositories/product_repository.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';

import 'package:fiap_farms/data/sources/product_service.dart';
import 'package:fiap_farms/data/models/product_model.dart';

import 'package:fiap_farms/utils/result.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _productService;

  ProductRepositoryImpl(this._productService);

  @override
  Future<Result<void>> createProduct(ProductEntity product) async {
    final productModel = ProductModel.fromEntity(product);
    return _productService.createProduct(productModel);
  }

  @override
  Future<Result<ProductEntity>> getProduct(String productId) async {
    final result = await _productService.getProduct(productId);
    return switch (result) {
      Ok(value: final productModel) => Result.ok(productModel.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<List<ProductEntity>>> getProducts(String userId) async {
    final result = await _productService.getProducts(userId);
    return switch (result) {
      Ok(value: final productModels) => Result.ok(
        productModels.map((model) => model.toEntity()).toList(),
      ),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<void>> updateProduct(ProductEntity product) async {
    final productModel = ProductModel.fromEntity(product);
    return _productService.updateProduct(productModel);
  }

  @override
  Future<Result<void>> updateProductQuantity(
    String productId,
    double productQuantity,
  ) {
    return _productService.updateProductQuantity(productId, productQuantity);
  }
}
