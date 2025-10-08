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
                TextFormField(
                  initialValue: _store.unitOfMeasure,
                  decoration: InputDecoration(
                    labelText: "Unidade de medida",
                    errorText: _store.unitOfMeasureError,
                  ),
                  onChanged: _store.setUnitOfMeasure,
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
