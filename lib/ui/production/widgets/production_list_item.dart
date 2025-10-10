import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/utils/production_status_translation.dart';

class ProductionListItem extends StatelessWidget {
  final ProductionEntity production;
  final VoidCallback onTap;

  const ProductionListItem({
    required this.production,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    String buildDateString() {
      String start = dateFormat.format(production.plantingDate);
      String end = dateFormat.format(
        production.actualHarvestDate ?? production.expectedHarvestDate,
      );

      return '$start - $end';
    }

    String buildQuantityString() {
      final numberFormat = NumberFormat.decimalPattern('pt_BR');
      String planted = numberFormat.format(production.quantityPlanted);
      if (production.quantityHarvested != null) {
        return '$planted / ${numberFormat.format(production.quantityHarvested!)} ${production.unit}';
      }
      return '$planted ${production.unit}';
    }

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            production.productName,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: production.status.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              production.status.displayName,
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
      trailing: const Icon(Icons.chevron_right_outlined, size: 32),
      onTap: onTap,
    );
  }
}
