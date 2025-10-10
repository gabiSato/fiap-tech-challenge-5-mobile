import 'package:fiap_farms/domain/entities/sowing_method.dart';

extension SowingMethodExtension on SowingMethod {
  String get displayName {
    switch (this) {
      case SowingMethod.direct:
        return 'Direto';
      case SowingMethod.transplant:
        return 'Transplante';
      case SowingMethod.seed:
        return 'Semente';
    }
  }
}
