import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import 'package:fiap_farms/ui/product/stores/product_list_store.dart';
import 'package:fiap_farms/utils/product_enums_translation.dart';
import 'package:fiap_farms/ui/product/widgets/product_form.dart';
import 'package:fiap_farms/ui/core/widgets/widgets.dart';

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
              subtitle: Text(
                'Categoria: ${product.category.displayName} | Preço: R\$${product.pricePerUnit.toStringAsFixed(2)} / ${product.unit.displayName}',
              ),
              trailing: IconButton(
                onPressed: () async {
                  await FullScreenDialog.show(
                    context,
                    title: 'Editar Produto',
                    child: ProductForm(product: product),
                  );
                  store.fetchProducts();
                },
                icon: Icon(Icons.edit),
              ),
            );
          },
        );
      },
    );
  }
}
