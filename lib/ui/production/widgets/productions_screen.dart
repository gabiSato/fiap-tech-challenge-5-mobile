import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:fiap_farms/utils/production_status_translation.dart';
import 'package:fiap_farms/domain/entities/production_status.dart';
import 'package:fiap_farms/domain/entities/production_entity.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/routing/routes.dart';

import 'package:fiap_farms/ui/production/widgets/production_list_item.dart';
import 'package:fiap_farms/ui/production/widgets/production_details.dart';
import 'package:fiap_farms/ui/production/stores/productions_store.dart';
import 'package:fiap_farms/ui/production/widgets/production_form.dart';
import 'package:fiap_farms/ui/core/widgets/full_screen_dialog.dart';

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

  void _showProductionDetails(ProductionEntity production) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ProductionDetails(production: production);
      },
    );
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
              return ProductionListItem(
                production: production,
                onTap: () => _showProductionDetails(production),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await FullScreenDialog.show<bool>(
            context,
            title: 'Novo Plantio',
            child: ProductionForm(),
          );

          if (result == true) {
            store.fetchProductions();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
