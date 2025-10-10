import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/routing/routes.dart';
import 'package:fiap_farms/ui/stock_batch/stores/stock_batch_list_store.dart';

class StockBatchListScreen extends StatefulWidget {
  const StockBatchListScreen({super.key});

  @override
  State<StockBatchListScreen> createState() => _StockBatchListScreenState();
}

class _StockBatchListScreenState extends State<StockBatchListScreen> {
  final StockBatchListStore _store = sl<StockBatchListStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchStockBatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque'),
        leading: IconButton(
          onPressed: () => context.go(Routes.home),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (_store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_store.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Erro: ${_store.errorMessage}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _store.fetchStockBatches,
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          if (_store.stockBatches.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Nenhum lote em estoque',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _store.fetchStockBatches,
            child: ListView.builder(
              itemCount: _store.stockBatches.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final batch = _store.stockBatches[index];
                final dateFormat = DateFormat('dd/MM/yyyy');

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: batch.status.color,
                      child: Text(
                        batch.batchNumber.substring(0, 2).toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      batch.productName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Lote: ${batch.batchNumber}'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow('Status', batch.status.displayName),
                            _buildInfoRow('Qualidade', batch.quality.displayName),
                            if (batch.grade != null)
                              _buildInfoRow('Classificação', batch.grade!.displayName),
                            const Divider(),
                            _buildInfoRow(
                              'Quantidade Atual',
                              '${batch.currentQuantity.toStringAsFixed(2)} ${batch.unit}',
                            ),
                            _buildInfoRow(
                              'Quantidade Inicial',
                              '${batch.initialQuantity.toStringAsFixed(2)} ${batch.unit}',
                            ),
                            _buildInfoRow(
                              'Vendido',
                              '${batch.soldQuantity.toStringAsFixed(2)} ${batch.unit}',
                            ),
                            _buildInfoRow(
                              'Reservado',
                              '${batch.reservedQuantity.toStringAsFixed(2)} ${batch.unit}',
                            ),
                            if (batch.lostQuantity > 0)
                              _buildInfoRow(
                                'Perdido',
                                '${batch.lostQuantity.toStringAsFixed(2)} ${batch.unit}',
                                valueColor: Colors.red,
                              ),
                            const Divider(),
                            _buildInfoRow(
                              'Custo Total',
                              'R\$ ${batch.totalCost.toStringAsFixed(2)}',
                            ),
                            _buildInfoRow(
                              'Custo/Unidade',
                              'R\$ ${batch.averageCostPerUnit.toStringAsFixed(2)}',
                            ),
                            const Divider(),
                            _buildInfoRow(
                              'Data Colheita',
                              dateFormat.format(batch.harvestDate),
                            ),
                            _buildInfoRow(
                              'Data Recebimento',
                              dateFormat.format(batch.receivedDate),
                            ),
                            if (batch.expirationDate != null)
                              _buildInfoRow(
                                'Data Validade',
                                dateFormat.format(batch.expirationDate!),
                                valueColor: batch.isExpired ? Colors.red : null,
                              ),
                            if (batch.warehouseLocation != null)
                              _buildInfoRow('Localização', batch.warehouseLocation!),
                            if (batch.notes != null && batch.notes!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Observações: ${batch.notes}',
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

// Extension para adicionar display names e cores aos enums
extension BatchStatusExtension on dynamic {
  String get displayName {
    switch (this.toString().split('.').last) {
      case 'available':
        return 'Disponível';
      case 'reserved':
        return 'Reservado';
      case 'soldOut':
        return 'Esgotado';
      case 'expired':
        return 'Vencido';
      case 'damaged':
        return 'Danificado';
      case 'excellent':
        return 'Excelente';
      case 'good':
        return 'Boa';
      case 'fair':
        return 'Regular';
      case 'poor':
        return 'Ruim';
      case 'a':
        return 'A';
      case 'b':
        return 'B';
      case 'c':
        return 'C';
      default:
        return toString().split('.').last;
    }
  }

  Color get color {
    switch (this.toString().split('.').last) {
      case 'available':
        return Colors.green;
      case 'reserved':
        return Colors.orange;
      case 'soldOut':
        return Colors.grey;
      case 'expired':
        return Colors.red;
      case 'damaged':
        return Colors.redAccent;
      default:
        return Colors.blue;
    }
  }
}
