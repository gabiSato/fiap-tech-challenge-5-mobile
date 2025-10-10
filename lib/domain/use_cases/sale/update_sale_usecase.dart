import 'package:fiap_farms/domain/repositories/sale_repository.dart';
import 'package:fiap_farms/domain/entities/sale_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class UpdateSaleUseCase {
  final SaleRepository _saleRepository;

  UpdateSaleUseCase(this._saleRepository);

  Future<Result<void>> call(SaleEntity sale) {
    return _saleRepository.updateSale(sale);
  }
}
