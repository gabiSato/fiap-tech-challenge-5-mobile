import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import 'package:fiap_farms/ui/product/stores/product_form_store.dart';
import 'package:fiap_farms/utils/product_enums_translation.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/ui/core/widgets/widgets.dart';

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
    return Observer(
      builder: (_) {
        if (_store.isSaved) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pop();
          });
        }

        if (_store.errorMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showErrorSnackBar(context, _store.errorMessage!);
            _store.errorMessage = null;
          });
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                labelText: "Nome do produto",
                initialValue: _store.name,
                errorText: _store.nameError,
                onChanged: _store.setName,
              ),
              const SizedBox(height: 24),
              AppDropdown<ProductCategory>(
                value: _store.category,
                labelText: 'Categoria',
                hintText: 'Selecione uma categoria',
                errorText: _store.categoryError,
                items: ProductCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.displayName),
                  );
                }).toList(),
                onChanged: _store.setCategory,
              ),
              const SizedBox(height: 24),
              AppDropdown<ProductUnit>(
                value: _store.unit,
                labelText: 'Unidade',
                hintText: 'Selecione uma unidade de medida',
                errorText: _store.unitError,
                items: ProductUnit.values.map((unit) {
                  return DropdownMenuItem(
                    value: unit,
                    child: Text(unit.displayName),
                  );
                }).toList(),
                onChanged: _store.setUnit,
              ),
              const SizedBox(height: 24),
              AppCurrencyTextField(
                labelText: "Preço por unidade",
                initialValue: _store.pricePerUnit,
                errorText: _store.pricePerUnitError,
                onChanged: _store.setPricePerUnit,
              ),
              const SizedBox(height: 32),
              SubmitButton(
                onPressed: _store.saveProduct,
                text: 'Salvar',
                isLoading: _store.isLoading,
              ),
            ],
          ),
        );
      },
    );
  }
}
