import 'package:fiap_farms/domain/repositories/sale_repository.dart';
import 'package:fiap_farms/domain/entities/sale_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetSalesUseCase {
  final SaleRepository _saleRepository;

  GetSalesUseCase(this._saleRepository);

  Future<Result<List<SaleEntity>>> call(String userId) {
    return _saleRepository.getAllSales(userId);
  }
}
