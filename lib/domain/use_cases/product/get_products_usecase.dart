import 'package:fiap_farms/domain/repositories/product_repository.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';

import 'package:fiap_farms/utils/result.dart';

class GetProductsUseCase {
  final ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<Result<List<ProductEntity>>> call(String userId) {
    return _productRepository.getProducts(userId);
  }
}
