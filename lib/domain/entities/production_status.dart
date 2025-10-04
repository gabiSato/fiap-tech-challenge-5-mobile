import 'package:flutter/material.dart';

enum ProductionStatus { pending, inProduction, harvested }

extension ProductionStatusExtension on ProductionStatus {
  String get displayName {
    switch (this) {
      case ProductionStatus.pending:
        return 'Pendente';
      case ProductionStatus.inProduction:
        return 'Em produção';
      case ProductionStatus.harvested:
        return 'Colhido';
    }
  }

  Color get color {
    switch (this) {
      case ProductionStatus.pending:
        return Colors.grey.shade200;
      case ProductionStatus.inProduction:
        return Colors.yellow.shade200;
      case ProductionStatus.harvested:
        return Colors.green.shade200;
    }
  }
}
