import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fiap_farms/domain/entities/production_status.dart';
import 'package:fiap_farms/routing/routes.dart';

import 'production_list_item.dart';

class ProductionsScreen extends StatelessWidget {
  const ProductionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantações'),
        leading: IconButton(
          onPressed: () => context.go(Routes.home),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          ProductionListItem(
            productName: 'Feijão',
            status: ProductionStatus.pending,
            startDate: DateTime(2025, 10, 3),
            quantityPlanted: 8000.0,
            unitOfMeasure: 'unidades',
          ),
          ProductionListItem(
            productName: 'Arroz',
            status: ProductionStatus.inProduction,
            startDate: DateTime(2025, 10, 3),
            quantityPlanted: 8000.0,
            unitOfMeasure: 'kg',
          ),
          ProductionListItem(
            productName: 'Soja',
            status: ProductionStatus.harvested,
            startDate: DateTime(2025, 10, 3),
            harvestDate: DateTime(2025, 11, 3),
            quantityPlanted: 8000.0,
            quantityHarvested: 16000.0,
            unitOfMeasure: 'toneladas',
          ),
        ],
      ),
    );
  }
}
