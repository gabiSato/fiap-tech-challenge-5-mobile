import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import 'package:fiap_farms/ui/product/stores/product_form_store.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';

class ProductForm extends StatefulWidget {
  final ProductEntity? product;

  const ProductForm({super.key, this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final ProductFormStore _store = sl<ProductFormStore>();

  @override
  void initState() {
    super.initState();
    _store.setProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Novo Produto' : 'Editar Produto'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (_store.isSaved) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop();
            });
          }

          if (_store.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_store.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
              _store.errorMessage = null;
            });
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: _store.name,
                  decoration: InputDecoration(
                    labelText: "Nome do produto",
                    errorText: _store.nameError,
                  ),
                  onChanged: _store.setName,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ProductCategory>(
                  initialValue: _store.category,
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                    errorText: _store.categoryError,
                  ),
                  items: ProductCategory.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: _store.setCategory,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ProductUnit>(
                  initialValue: _store.unit,
                  decoration: InputDecoration(
                    labelText: 'Unidade',
                    errorText: _store.unitError,
                  ),
                  items: ProductUnit.values.map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit.name),
                    );
                  }).toList(),
                  onChanged: _store.setUnit,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _store.pricePerUnit,
                  decoration: InputDecoration(
                    labelText: "Preço por unidade",
                    errorText: _store.pricePerUnitError,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: _store.setPricePerUnit,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _store.currentStock,
                  decoration: InputDecoration(
                    labelText: "Estoque atual",
                    errorText: _store.currentStockError,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: _store.setCurrentStock,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: !_store.isLoading ? _store.saveProduct : null,
                  child: _store.isLoading
                      ? const CircularProgressIndicator(
                          constraints: BoxConstraints.tightFor(
                            width: 24,
                            height: 24,
                          ),
                        )
                      : const Text('Salvar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
