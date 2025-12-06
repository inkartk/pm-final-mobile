import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/trading_cycle.dart';
import '../utils/constants.dart';

class AgentLogsScreen extends StatelessWidget {
  final TradingCycleResponse cycle;

  const AgentLogsScreen({
    super.key,
    required this.cycle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Логи агентов'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        children: [
          // Cycle info header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Цикл #${cycle.cycleId}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Символ: ${cycle.marketData.symbol}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Решение: ${cycle.decision.action} (${(cycle.decision.confidence * 100).toInt()}%)',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Статус: ${cycle.execution.status}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Market Monitor Agent Logs
          _buildLogSection(
            context,
            AppStrings.marketMonitorAgent,
            cycle.logs.marketAgent,
            AppColors.activeColor,
          ),

          const SizedBox(height: 16),

          // Decision Maker Agent Logs
          _buildLogSection(
            context,
            AppStrings.decisionMakerAgent,
            cycle.logs.decisionAgent,
            AppColors.successColor,
          ),

          const SizedBox(height: 16),

          // Execution Agent Logs
          _buildLogSection(
            context,
            AppStrings.executionAgent,
            cycle.logs.executionAgent,
            AppColors.warningColor,
          ),

          const SizedBox(height: 16),

          // Info card explaining the flow
          Card(
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue.shade700),
                      const SizedBox(width: 8),
                      Text(
                        'Поток данных',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '← Получение данных\n⚙ Обработка\n→ Отправка результата',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogSection(
    BuildContext context,
    String agentName,
    String logs,
    Color color,
  ) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Icon(Icons.article_outlined, color: color),
        title: Text(
          agentName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.paddingMedium),
            color: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  logs,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: logs));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Логи скопированы в буфер обмена'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.copy, size: 16),
                  label: const Text('Копировать'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
