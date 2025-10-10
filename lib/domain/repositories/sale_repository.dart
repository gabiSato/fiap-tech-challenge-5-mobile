import 'package:fiap_farms/domain/entities/sale_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class SaleRepository {
  Future<Result<SaleEntity>> getSale(String saleId);
  Future<Result<void>> createSale(SaleEntity sale);
  Future<Result<void>> updateSale(SaleEntity sale);
  Future<Result<void>> deleteSale(String saleId);
  Future<Result<List<SaleEntity>>> getAllSales(String userId);
}
