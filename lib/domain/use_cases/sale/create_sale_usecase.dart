import 'package:fiap_farms/domain/repositories/sale_repository.dart';
import 'package:fiap_farms/domain/entities/sale_entity.dart';
import 'package:fiap_farms/utils/result.dart';

class CreateSaleUseCase {
  final SaleRepository _saleRepository;

  CreateSaleUseCase(this._saleRepository);

  Future<Result<void>> call(SaleEntity sale) {
    return _saleRepository.createSale(sale);
  }
}
