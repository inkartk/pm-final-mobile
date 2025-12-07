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

        title: const Text('Agent Logs'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cycle #${cycle.cycleId}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Symbol: ${cycle.marketData.symbol}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Decision: ${cycle.decision.action} (${(cycle.decision.confidence * 100).toInt()}%)',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Status: ${cycle.execution.status}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          _buildLogSection(
            context,
            AppStrings.marketMonitorAgent,
            cycle.logs.marketAgent,
            AppColors.activeColor,
          ),

          const SizedBox(height: 16),

          _buildLogSection(
            context,
            AppStrings.decisionMakerAgent,
            cycle.logs.decisionAgent,
            AppColors.successColor,
          ),

          const SizedBox(height: 16),

          _buildLogSection(
            context,
            AppStrings.executionAgent,
            cycle.logs.executionAgent,
            AppColors.warningColor,
          ),

          const SizedBox(height: 16),

          Card(
            color: AppColors.infoColor.withOpacity(0.15),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: AppColors.infoColor),
                      SizedBox(width: 8),
                      Text(
                        'Data Flow',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.infoColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '← Receiving data\n⚙ Processing\n→ Sending result',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 13,
                    ),
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
            decoration: BoxDecoration(
              color: AppColors.darkCardBackgroundHighlight,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppSizes.borderRadiusMedium),
                bottomRight: Radius.circular(AppSizes.borderRadiusMedium),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  logs,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    height: 1.5,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: logs));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Logs copied to clipboard'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: AppColors.successColor,
                      ),
                    );
                  },
                  icon: const Icon(Icons.copy, size: 16),
                  label: const Text('Copy'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    side: const BorderSide(color: AppColors.activeColor),
                    foregroundColor: AppColors.activeColor,
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
