import 'package:fiap_farms/domain/repositories/product_repository.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';

import 'package:fiap_farms/utils/result.dart';

class UpdateProductUseCase {
  final ProductRepository _productRepository;

  UpdateProductUseCase(this._productRepository);

  Future<Result<void>> call(ProductEntity product) {
    return _productRepository.updateProduct(product);
  }
}
