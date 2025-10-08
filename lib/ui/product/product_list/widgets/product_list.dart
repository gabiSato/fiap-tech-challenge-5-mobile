import 'package:fiap_farms/ui/product/product_list/stores/product_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductList extends StatelessWidget {
  const ProductList({required this.store, super.key});

  final ProductListStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
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
                  onPressed: store.fetchProducts,
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        if (store.products.isEmpty) {
          return const Center(child: Text('Nenhum produto encontrado.'));
        }

        return ListView.builder(
          itemCount: store.products.length,
          itemBuilder: (context, index) {
            final product = store.products[index];

            return ListTile(
              title: Text(product.name),
              subtitle: Text(product.unitOfMeasure),
            );
          },
        );
      },
    );
  }
}
