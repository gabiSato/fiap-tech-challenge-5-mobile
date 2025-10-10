import 'package:fiap_farms/domain/entities/product_entity.dart';

extension ProductCategoryExtension on ProductCategory {
  String get displayName {
    switch (this) {
      case ProductCategory.vegetables:
        return 'Legumes';
      case ProductCategory.fruits:
        return 'Frutas';
      case ProductCategory.grains:
        return 'Grãos';
      case ProductCategory.dairy:
        return 'Laticínios';
      case ProductCategory.meat:
        return 'Carnes';
      case ProductCategory.other:
        return 'Outros';
    }
  }
}

extension ProductUnitExtension on ProductUnit {
  String get displayName {
    switch (this) {
      case ProductUnit.kg:
        return 'Kg';
      case ProductUnit.unit:
        return 'Unidades';
      case ProductUnit.liter:
        return 'Litro';
      case ProductUnit.bunch:
        return 'Maço';
    }
  }
}
