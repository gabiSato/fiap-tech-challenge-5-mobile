import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fiap_farms/domain/entities/production_status.dart';

class ProductionListItem extends StatelessWidget {
  final String productName;
  final String unitOfMeasure;
  final ProductionStatus status;
  final DateTime startDate;
  final DateTime? harvestDate;
  final num quantityPlanted;
  final num? quantityHarvested;

  const ProductionListItem({
    super.key,
    required this.productName,
    required this.unitOfMeasure,
    required this.status,
    required this.startDate,
    required this.quantityPlanted,
    this.harvestDate,
    this.quantityHarvested,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.decimalPattern('pt_BR');
    final dateFormat = DateFormat('dd/MM/yyyy');

    String buildDateString() {
      String start = dateFormat.format(startDate);
      if (harvestDate != null) {
        return '$start - ${dateFormat.format(harvestDate!)}';
      }
      return start;
    }

    String buildQuantityString() {
      String planted = numberFormat.format(quantityPlanted);
      if (quantityHarvested != null) {
        return '$planted / ${numberFormat.format(quantityHarvested)} $unitOfMeasure';
      }
      return '$planted $unitOfMeasure';
    }

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            productName,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: status.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status.displayName,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(buildDateString()),
          const SizedBox(height: 4),
          Text(
            buildQuantityString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
