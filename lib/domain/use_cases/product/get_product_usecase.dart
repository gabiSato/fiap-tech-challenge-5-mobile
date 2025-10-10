import 'package:fiap_farms/domain/repositories/product_repository.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';

import 'package:fiap_farms/utils/result.dart';

class GetProductUseCase {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  Future<Result<ProductEntity>> call(String id) {
    return _productRepository.getProduct(id);
  }
}
