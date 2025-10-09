import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fiap_farms/utils/production_status_translation.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/domain/entities/production_status.dart';

class ProductionDetails extends StatelessWidget {
  final ProductionEntity production;
  final dateFormat = DateFormat('dd/MM/yyyy');
  final numberFormat = NumberFormat.decimalPattern('pt_BR');
  final currencyFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

  ProductionDetails({required this.production, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 32.0, 20.0, 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                production.productName,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
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
          const SizedBox(height: 16),
          Text(
            'Data de Plantio: ${dateFormat.format(production.plantingDate)}',
          ),
          Text(
            'Previsão de Colheita: ${dateFormat.format(production.expectedHarvestDate)}',
          ),
          if (production.actualHarvestDate != null)
            Text(
              'Data da Colheita: ${dateFormat.format(production.actualHarvestDate!)}',
            ),
          const SizedBox(height: 16),
          Text(
            'Quantidade Plantada: ${numberFormat.format(production.quantityPlanted)} ${production.unit}',
          ),
          if (production.quantityHarvested != null)
            Text(
              'Quantidade Colhida: ${numberFormat.format(production.quantityHarvested)} ${production.unit}',
            ),
          if (production.areaPlanted != null && production.areaUnit != null)
            Text(
              'Área plantada: ${numberFormat.format(production.areaPlanted)} ${production.areaUnit!.name}',
            ),
          Text(
            'Custo total: R\$ ${currencyFormat.format(production.totalCost)}',
          ),

          if (production.status == ProductionStatus.in_production) ...[
            const SizedBox(height: 32),
            FilledButton(onPressed: () {}, child: Text('Registrar colheita')),
            const SizedBox(height: 4),
            OutlinedButton(onPressed: () {}, child: Text('Cancelar plantio')),
          ],
        ],
      ),
    );
  }
}
