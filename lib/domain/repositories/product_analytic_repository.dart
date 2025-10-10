import 'package:fiap_farms/domain/entities/product_analytic_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class ProductAnalyticRepository {
  Future<Result<void>> createProductAnalytic(
    ProductAnalyticEntity productAnalytic,
  );
  Future<Result<void>> updateProductAnalytic(
    ProductAnalyticEntity productAnalytic,
  );
  Future<Result<List<ProductAnalyticEntity>>> getProductsWithHighestProfit(
    String userId,
  );
}
