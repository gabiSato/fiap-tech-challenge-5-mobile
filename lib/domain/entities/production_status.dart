import 'package:flutter/material.dart';

enum ProductionStatus { waiting, in_production, harvested, cancelled }

extension ProductionStatusExtension on ProductionStatus {
  String get displayName {
    switch (this) {
      case ProductionStatus.waiting:
        return 'Pendente';
      case ProductionStatus.in_production:
        return 'Em produção';
      case ProductionStatus.harvested:
        return 'Colhido';
      case ProductionStatus.cancelled:
        return 'Cancelada';
    }
  }

  Color get color {
    switch (this) {
      case ProductionStatus.waiting:
        return Colors.grey.shade200;
      case ProductionStatus.in_production:
        return Colors.yellow.shade200;
      case ProductionStatus.harvested:
        return Colors.green.shade200;
      case ProductionStatus.cancelled:
        return Colors.red.shade200;
    }
  }
}
