import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/routing/routes.dart';
import 'package:fiap_farms/ui/goal/stores/goal_list_store.dart';

class GoalListScreen extends StatefulWidget {
  const GoalListScreen({super.key});

  @override
  State<GoalListScreen> createState() => _GoalListScreenState();
}

class _GoalListScreenState extends State<GoalListScreen> {
  final GoalListStore _store = sl<GoalListStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metas'),
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
                    onPressed: _store.fetchGoals,
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          if (_store.goals.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.flag_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Nenhuma meta cadastrada',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _store.fetchGoals,
            child: ListView.builder(
              itemCount: _store.goals.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final goal = _store.goals[index];
                final dateFormat = DateFormat('dd/MM/yyyy');
                final progress = goal.currentValue / goal.targetValue;
                final progressPercent = (progress * 100).clamp(0, 100);

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: _getGoalColor(progress, goal.isCompleted),
                      child: Icon(
                        goal.isCompleted ? Icons.check : Icons.flag,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      goal.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(_getGoalTypeText(goal.type)),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: progress.clamp(0, 1),
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _getGoalColor(progress, goal.isCompleted),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${progressPercent.toStringAsFixed(1)}% concluído',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (goal.description != null &&
                                goal.description!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  goal.description!,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            _buildInfoRow('Tipo', _getGoalTypeText(goal.type)),
                            _buildInfoRow('Período', _getGoalPeriodText(goal.period)),
                            const Divider(),
                            _buildInfoRow(
                              'Meta',
                              '${goal.targetValue.toStringAsFixed(2)} ${goal.unit}',
                            ),
                            _buildInfoRow(
                              'Atual',
                              '${goal.currentValue.toStringAsFixed(2)} ${goal.unit}',
                              valueColor: _getGoalColor(progress, goal.isCompleted),
                            ),
                            _buildInfoRow(
                              'Faltam',
                              '${(goal.targetValue - goal.currentValue).toStringAsFixed(2)} ${goal.unit}',
                              valueColor: goal.isCompleted ? Colors.green : Colors.orange,
                            ),
                            const Divider(),
                            _buildInfoRow(
                              'Início',
                              dateFormat.format(goal.startDate),
                            ),
                            _buildInfoRow(
                              'Término',
                              dateFormat.format(goal.endDate),
                            ),
                            if (goal.isCompleted)
                              _buildInfoRow(
                                'Status',
                                'CONCLUÍDA',
                                valueColor: Colors.green,
                              )
                            else
                              _buildInfoRow(
                                'Status',
                                _getDaysRemaining(goal.endDate),
                                valueColor: _getDaysRemaining(goal.endDate)
                                        .contains('atrasado')
                                    ? Colors.red
                                    : Colors.blue,
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

  Color _getGoalColor(double progress, bool isCompleted) {
    if (isCompleted) return Colors.green;
    if (progress >= 0.8) return Colors.lightGreen;
    if (progress >= 0.5) return Colors.orange;
    return Colors.red;
  }

  String _getGoalTypeText(dynamic type) {
    switch (type.toString().split('.').last) {
      case 'sales':
        return 'Vendas';
      case 'production':
        return 'Produção';
      case 'revenue':
        return 'Receita';
      case 'profit':
        return 'Lucro';
      case 'customers':
        return 'Clientes';
      case 'other':
        return 'Outro';
      default:
        return type.toString();
    }
  }

  String _getGoalPeriodText(dynamic period) {
    switch (period.toString().split('.').last) {
      case 'daily':
        return 'Diário';
      case 'weekly':
        return 'Semanal';
      case 'monthly':
        return 'Mensal';
      case 'quarterly':
        return 'Trimestral';
      case 'yearly':
        return 'Anual';
      case 'custom':
        return 'Personalizado';
      default:
        return period.toString();
    }
  }

  String _getDaysRemaining(DateTime endDate) {
    final now = DateTime.now();
    final difference = endDate.difference(now).inDays;

    if (difference < 0) {
      return '${difference.abs()} dias atrasado';
    } else if (difference == 0) {
      return 'Último dia';
    } else if (difference == 1) {
      return '1 dia restante';
    } else {
      return '$difference dias restantes';
    }
  }
}
