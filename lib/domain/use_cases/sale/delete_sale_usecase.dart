import 'package:fiap_farms/domain/repositories/sale_repository.dart';
import 'package:fiap_farms/utils/result.dart';

class DeleteSaleUseCase {
  final SaleRepository _saleRepository;

  DeleteSaleUseCase(this._saleRepository);

  Future<Result<void>> call(String saleId) {
    return _saleRepository.deleteSale(saleId);
  }
}
