import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/routing/routes.dart';
import 'package:fiap_farms/ui/sale/stores/sale_list_store.dart';

class SaleListScreen extends StatefulWidget {
  const SaleListScreen({super.key});

  @override
  State<SaleListScreen> createState() => _SaleListScreenState();
}

class _SaleListScreenState extends State<SaleListScreen> {
  final SaleListStore _store = sl<SaleListStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchSales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendas'),
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
                    onPressed: _store.fetchSales,
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          if (_store.sales.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Nenhuma venda registrada',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _store.fetchSales,
            child: ListView.builder(
              itemCount: _store.sales.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final sale = _store.sales[index];
                final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
                final currencyFormat = NumberFormat.currency(
                  locale: 'pt_BR',
                  symbol: 'R\$',
                );

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: _getStatusColor(sale.status),
                      child: Icon(
                        _getStatusIcon(sale.status),
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      sale.customerName ?? 'Venda #${sale.id?.substring(0, 8)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${dateFormat.format(sale.saleDate)} - ${_getStatusText(sale.status)}',
                    ),
                    trailing: Text(
                      currencyFormat.format(sale.totalAmount),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (sale.customerContact != null)
                              _buildInfoRow('Contato', sale.customerContact!),
                            if (sale.customerEmail != null)
                              _buildInfoRow('Email', sale.customerEmail!),
                            if (sale.customerDocument != null)
                              _buildInfoRow('CPF/CNPJ', sale.customerDocument!),
                            const Divider(),
                            const Text(
                              'Itens da Venda:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ...sale.items.map((item) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${item.productName} (${item.quantity} ${item.unit})',
                                        ),
                                      ),
                                      Text(
                                        currencyFormat.format(item.totalPrice),
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                            const Divider(),
                            _buildInfoRow(
                              'Subtotal',
                              currencyFormat.format(sale.totalAmount),
                            ),
                            if (sale.deliveryFee != null && sale.deliveryFee! > 0)
                              _buildInfoRow(
                                'Taxa de Entrega',
                                currencyFormat.format(sale.deliveryFee),
                              ),
                            _buildInfoRow(
                              'Custo Total',
                              currencyFormat.format(sale.totalCost),
                            ),
                            _buildInfoRow(
                              'Lucro',
                              currencyFormat.format(sale.totalProfit),
                              valueColor: Colors.green,
                            ),
                            _buildInfoRow(
                              'Margem',
                              '${sale.profitMargin.toStringAsFixed(1)}%',
                              valueColor: Colors.green,
                            ),
                            const Divider(),
                            if (sale.paymentMethod != null)
                              _buildInfoRow(
                                'Pagamento',
                                _getPaymentMethodText(sale.paymentMethod!),
                              ),
                            _buildInfoRow(
                              'Status Pagamento',
                              sale.isPaid ? 'Pago' : 'Pendente',
                              valueColor: sale.isPaid ? Colors.green : Colors.orange,
                            ),
                            if (sale.paymentDate != null)
                              _buildInfoRow(
                                'Data Pagamento',
                                dateFormat.format(sale.paymentDate!),
                              ),
                            if (sale.deliveryAddress != null) ...[
                              const Divider(),
                              _buildInfoRow('Endereço Entrega', sale.deliveryAddress!),
                              if (sale.deliveryDate != null)
                                _buildInfoRow(
                                  'Data Entrega',
                                  dateFormat.format(sale.deliveryDate!),
                                ),
                            ],
                            if (sale.notes != null && sale.notes!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Observações: ${sale.notes}',
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

  Color _getStatusColor(dynamic status) {
    switch (status.toString().split('.').last) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(dynamic status) {
    switch (status.toString().split('.').last) {
      case 'completed':
        return Icons.check_circle;
      case 'pending':
        return Icons.pending;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }

  String _getStatusText(dynamic status) {
    switch (status.toString().split('.').last) {
      case 'completed':
        return 'Concluída';
      case 'pending':
        return 'Pendente';
      case 'cancelled':
        return 'Cancelada';
      default:
        return status.toString();
    }
  }

  String _getPaymentMethodText(dynamic method) {
    switch (method.toString().split('.').last) {
      case 'cash':
        return 'Dinheiro';
      case 'debitCard':
        return 'Cartão de Débito';
      case 'creditCard':
        return 'Cartão de Crédito';
      case 'pix':
        return 'PIX';
      case 'bankTransfer':
        return 'Transferência';
      case 'check':
        return 'Cheque';
      case 'other':
        return 'Outro';
      default:
        return method.toString();
    }
  }
}
