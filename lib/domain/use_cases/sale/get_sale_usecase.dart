import 'package:fiap_farms/domain/repositories/sale_repository.dart';
import 'package:fiap_farms/domain/entities/sale_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class GetSaleUseCase {
  final SaleRepository _saleRepository;

  GetSaleUseCase(this._saleRepository);

  Future<Result<SaleEntity>> call(String saleId) {
    return _saleRepository.getSale(saleId);
  }
}
