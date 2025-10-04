import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fiap_farms/routing/routes.dart';

import 'home_app_bar.dart';
import 'navigation_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          NavigationMenu(
            menuItems: [
              MenuItem(
                icon: Icons.agriculture_outlined,
                label: 'Plantações',
                onTap: () => context.go(Routes.productions),
              ),
              MenuItem(
                icon: Icons.sell_outlined,
                label: 'Vendas',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.warehouse_outlined,
                label: 'Estoque',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.task_alt_outlined,
                label: 'Metas',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
