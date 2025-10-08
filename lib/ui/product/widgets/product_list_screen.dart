import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:fiap_farms/ui/product/stores/product_list_store.dart';
import 'package:fiap_farms/ui/product/widgets/product_form.dart';
import 'package:fiap_farms/ui/product/widgets/product_list.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/routing/routes.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListStore _store = sl<ProductListStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        leading: IconButton(
          onPressed: () => context.go(Routes.home),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ProductList(store: _store),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFullScreenDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<dynamic> _showFullScreenDialog(BuildContext context) {
  return showDialog(
    context: context,
    fullscreenDialog: true,
    useSafeArea: false,
    builder: (BuildContext context) => ProductForm(),
  );
}
