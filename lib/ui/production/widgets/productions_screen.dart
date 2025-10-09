import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fiap_farms/ui/production/stores/productions_store.dart';
import 'package:fiap_farms/ui/production/widgets/production_form.dart';
import 'package:fiap_farms/utils/production_status_translation.dart';
import 'package:fiap_farms/ui/core/widgets/full_screen_dialog.dart';
import 'package:fiap_farms/domain/entities/production_status.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/routing/routes.dart';

class ProductionsScreen extends StatefulWidget {
  const ProductionsScreen({super.key});

  @override
  State<ProductionsScreen> createState() => _ProductionsScreenState();
}

class _ProductionsScreenState extends State<ProductionsScreen> {
  final ProductionsStore store = sl<ProductionsStore>();

  @override
  void initState() {
    super.initState();

    store.fetchProductions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantios'),
        leading: IconButton(
          onPressed: () => context.go(Routes.home),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Observer(
            builder: (_) => PopupMenuButton<ProductionStatus?>(
              onSelected: store.setSelectedStatus,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<ProductionStatus?>(
                    value: null,
                    child: Text('Todos'),
                  ),
                  ...ProductionStatus.values.map((status) {
                    return PopupMenuItem<ProductionStatus?>(
                      value: status,
                      child: Text(status.displayName),
                    );
                  }),
                ];
              },
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(store.errorMessage!),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: store.fetchProductions,
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          if (store.filteredProductions.isEmpty) {
            return const Center(child: Text('Nenhuma plantação encontrada.'));
          }

          return ListView.builder(
            itemCount: store.filteredProductions.length,
            itemBuilder: (context, index) {
              final production = store.filteredProductions[index];
              final dateFormat = DateFormat('dd/MM/yyyy');

              String buildDateString() {
                String start = dateFormat.format(production.plantingDate);
                if (production.actualHarvestDate != null) {
                  return '$start - ${dateFormat.format(production.actualHarvestDate!)}';
                }
                return start;
              }

              String buildQuantityString() {
                final numberFormat = NumberFormat.decimalPattern('pt_BR');
                String planted = numberFormat.format(
                  production.quantityPlanted,
                );
                if (production.quantityHarvested != null) {
                  return '$planted / ${numberFormat.format(production.quantityHarvested!)} ${production.unit}';
                }
                return '$planted ${production.unit}';
              }

              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      production.productName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
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
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
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
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FullScreenDialog.show(
            context,
            title: 'Novo Plantio',
            child: ProductionForm(),
          );
          store.fetchProductions();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
