import 'package:fiap_farms/domain/entities/sale_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class SaleRepository {
  Future<Result<SaleEnity>> getSale(String saleId);
  Future<Result<void>> createSale(SaleEnity sale);
  Future<Result<void>> updateSale(SaleEnity sale);
  Future<Result<void>> deleteSale(String saleId);
  Future<Result<List<SaleEnity>>> getAllSales(String userId);
}
