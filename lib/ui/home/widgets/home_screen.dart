import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fiap_farms/routing/routes.dart';
import 'home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {
        'icon': Icons.agriculture_outlined,
        'label': 'Plantações',
        'route': Routes.productions,
      },
      {'icon': Icons.sell_outlined, 'label': 'Vendas', 'route': '/sales'},
      {
        'icon': Icons.warehouse_outlined,
        'label': 'Estoque',
        'route': '/inventory',
      },
      {'icon': Icons.task_alt_outlined, 'label': 'Metas', 'route': '/goals'},
      {
        'icon': Icons.inventory_2_outlined,
        'label': 'Produtos',
        'route': Routes.products,
      },
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = menuItems[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => context.go(item['route']! as String),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon']! as IconData, size: 32),
                        const SizedBox(height: 8),
                        Text(item['label']! as String),
                      ],
                    ),
                  ),
                );
              }, childCount: menuItems.length),
            ),
          ),
        ],
      ),
    );
  }
}
