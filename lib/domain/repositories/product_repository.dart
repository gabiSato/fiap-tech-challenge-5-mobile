import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class ProductRepository {
  Future<Result<ProductEntity>> getProduct(String productId);
  Future<Result<void>> createProduct(ProductEntity product);
  Future<Result<void>> updateProduct(ProductEntity product);
  Future<Result<void>> updateProductQuantity(
    String productId,
    double productQuantity,
  );
  Future<Result<List<ProductEntity>>> getProducts(String userId);
}
