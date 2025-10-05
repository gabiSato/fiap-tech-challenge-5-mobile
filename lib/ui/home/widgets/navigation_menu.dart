import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  final List<MenuItem> menuItems;
  const NavigationMenu({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
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
              onTap: item.onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, size: 32),
                  const SizedBox(height: 8),
                  Text(item.label),
                ],
              ),
            ),
          );
        }, childCount: menuItems.length),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  MenuItem({required this.icon, required this.label, required this.onTap});
}
