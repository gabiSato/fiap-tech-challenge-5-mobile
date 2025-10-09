import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fiap_farms/ui/production/stores/production_form_store.dart';
import 'package:fiap_farms/utils/product_enums_translation.dart';
import 'package:fiap_farms/utils/sowing_method_translation.dart';
import 'package:fiap_farms/domain/entities/product_entity.dart';
import 'package:fiap_farms/domain/entities/sowing_method.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/domain/entities/area_unit.dart';
import 'package:fiap_farms/ui/core/widgets/widgets.dart';

class ProductionForm extends StatefulWidget {
  const ProductionForm({super.key});

  @override
  State<ProductionForm> createState() => _ProductionFormState();
}

class _ProductionFormState extends State<ProductionForm> {
  final ProductionFormStore _store = sl<ProductionFormStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchProducts();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Observer(
          builder: (_) {
            if (_store.isLoading && _store.products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

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

            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  _buildBasicInfoSection(context),
                  const SizedBox(height: 24),
                  _buildCostsSection(context),
                  const SizedBox(height: 24),
                  _buildAreaInfoSection(context),
                  const SizedBox(height: 24),
                  _buildAgronomicInfoSection(context),
                  const SizedBox(height: 32),
                  SubmitButton(
                    onPressed: _store.saveProduction,
                    text: 'Cadastrar plantio',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        AppDropdown<ProductEntity>(
          labelText: 'Produto',
          hintText: 'Selecione um produto',
          value: _store.product,
          onChanged: _store.setProduct,
          items: _store.products.map((product) {
            return DropdownMenuItem(value: product, child: Text(product.name));
          }).toList(),
          errorText: _store.productError,
        ),
        const SizedBox(height: 24),
        AppTextField(
          labelText: 'Quantidade plantada',
          keyboardType: TextInputType.number,
          onChanged: _store.setQuantityPlanted,
          errorText: _store.quantityError,
          suffix: _store.product?.unit.displayName != null
              ? Text(_store.product!.unit.displayName)
              : null,
        ),
        const SizedBox(height: 24),
        AppDatePicker(
          labelText: 'Data prevista de colheita',
          onDateSelected: _store.setExpectedHarvestDate,
          selectedDate: _store.expectedHarvestDate,
          errorText: _store.expectedHarvestDateError,
        ),
      ],
    );
  }

  Widget _buildCostsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custos de Produção',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 24),
        AppCurrencyTextField(
          labelText: 'Custo em sementes',
          onChanged: _store.setSeedCost,
        ),
        const SizedBox(height: 24),
        AppCurrencyTextField(
          labelText: 'Custo em mão de obra',
          onChanged: _store.setLaborCost,
        ),
        const SizedBox(height: 24),
        AppCurrencyTextField(
          labelText: 'Custo em fertilizantes',
          onChanged: _store.setFertilizerCost,
        ),
        const SizedBox(height: 24),
        AppCurrencyTextField(
          labelText: 'Custo em irrigação',
          onChanged: _store.setIrrigationCost,
        ),
        const SizedBox(height: 24),
        AppCurrencyTextField(
          labelText: 'Outros custos',
          onChanged: _store.setOtherCosts,
        ),
        const SizedBox(height: 24),
        AppTextField(
          labelText: 'Custo total',
          controller: TextEditingController(
            text: NumberFormat.simpleCurrency(
              locale: 'pt_BR',
            ).format(_store.totalCost),
          ),
          readOnly: true,
        ),
      ],
    );
  }

  Widget _buildAreaInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informações de Área',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 24),
        AppTextField(
          labelText: 'Área plantada',
          keyboardType: TextInputType.number,
          onChanged: _store.setAreaPlanted,
          errorText: _store.areaPlantedError,
        ),
        const SizedBox(height: 24),
        AppDropdown<AreaUnit>(
          labelText: 'Unidade',
          hintText: 'Selecione a unidade de área',
          value: _store.areaUnit,
          onChanged: _store.setAreaUnit,
          items: AreaUnit.values.map((unit) {
            return DropdownMenuItem(value: unit, child: Text(unit.value));
          }).toList(),
        ),
        const SizedBox(height: 24),
        AppTextField(
          labelText: 'Localização do lote',
          onChanged: _store.setPlotLocation,
        ),
      ],
    );
  }

  Widget _buildAgronomicInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informações Agronômicas',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 24),
        AppTextField(
          labelText: 'Variedade cultivar',
          onChanged: _store.setVarietyName,
        ),
        const SizedBox(height: 24),
        AppDropdown<SowingMethod>(
          labelText: 'Método de plantio',
          hintText: 'Selecione o método de plantio',
          value: _store.sowingMethod,
          onChanged: _store.setSowingMethod,
          items: SowingMethod.values.map((method) {
            return DropdownMenuItem(
              value: method,
              child: Text(method.displayName),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        AppTextField(
          labelText: 'Produtividade esperada por área',
          keyboardType: TextInputType.number,
          onChanged: _store.setExpectedYieldPerArea,
        ),
        const SizedBox(height: 24),
        AppTextField(labelText: 'Observações', onChanged: _store.setNotes),
      ],
    );
  }
}
