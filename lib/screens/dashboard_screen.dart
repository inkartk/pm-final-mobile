import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/trading_cycle_provider.dart';
import '../utils/constants.dart';
import '../widgets/agent_flow_indicator.dart';
import '../widgets/agent_card.dart';
import '../widgets/price_card.dart';
import '../widgets/decision_card.dart';
import '../widgets/execution_card.dart';
import 'trade_history_screen.dart';
import 'agent_logs_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleState = ref.watch(tradingCycleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TradeHistoryScreen()),
              );
            },
            tooltip: 'История сделок',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
            tooltip: 'Настройки',
          ),
        ],
      ),
      body: cycleState.when(
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(AppStrings.loadingMessage),
            ],
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.errorColor,
              ),
              const SizedBox(height: 16),
              Text('${AppStrings.errorMessage}: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(tradingCycleProvider.notifier).runCycle(),
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
        data: (cycle) {
          if (cycle == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.play_circle_outline,
                    size: 100,
                    color: AppColors.activeColor,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    AppStrings.emptyStateMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => ref.read(tradingCycleProvider.notifier).runCycle(),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Запустить торговый цикл'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(tradingCycleProvider.notifier).refresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Flow indicator showing all 3 steps completed
                  const AgentFlowIndicator(activeStep: 3),

                  const SizedBox(height: 16),

                  // Current price card
                  PriceCard(marketData: cycle.marketData),

                  const SizedBox(height: 8),

                  // Section header
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingMedium,
                      vertical: AppSizes.paddingSmall,
                    ),
                    child: Text(
                      'Коммуникация агентов',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Market Monitor Agent Card
                  AgentCard(
                    agentName: AppStrings.marketMonitorAgent,
                    status: AppStrings.statusCompleted,
                    statusColor: AppColors.completedColor,
                    input: 'Запрос на мониторинг ${cycle.marketData.symbol}',
                    action: 'Получена цена \$${cycle.marketData.price.toStringAsFixed(2)}, рассчитаны индикаторы',
                    output: 'Данные отправлены Decision Maker (Цена, SMA_10, SMA_50, RSI_14)',
                  ),

                  // Arrow down
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Icon(
                        Icons.arrow_downward,
                        size: 32,
                        color: AppColors.activeColor,
                      ),
                    ),
                  ),

                  // Decision Maker Agent Card
                  AgentCard(
                    agentName: AppStrings.decisionMakerAgent,
                    status: AppStrings.statusCompleted,
                    statusColor: AppColors.completedColor,
                    input: 'Рыночные данные с индикаторами',
                    action: 'ML модель предсказала ${cycle.decision.action} (${(cycle.decision.confidence * 100).toInt()}%)',
                    output: 'Решение: ${cycle.decision.action} отправлено Execution Agent',
                  ),

                  // Arrow down
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Icon(
                        Icons.arrow_downward,
                        size: 32,
                        color: AppColors.activeColor,
                      ),
                    ),
                  ),

                  // Execution Agent Card
                  AgentCard(
                    agentName: AppStrings.executionAgent,
                    status: cycle.execution.status,
                    statusColor: cycle.execution.status == AppStrings.statusFilled
                        ? AppColors.completedColor
                        : AppColors.warningColor,
                    input: 'Решение: ${cycle.decision.action}',
                    action: cycle.execution.executed
                        ? 'Симуляция исполнения сделки'
                        : 'Сделка пропущена (HOLD)',
                    output: 'Ордер ${cycle.execution.orderId}, Статус: ${cycle.execution.status}',
                  ),

                  const SizedBox(height: 24),

                  // Detailed decision card
                  DecisionCard(decision: cycle.decision),

                  // Detailed execution card
                  ExecutionCard(execution: cycle.execution),

                  const SizedBox(height: 16),

                  // Cycle summary card
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.paddingMedium),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.paddingMedium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Сводка цикла',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Divider(),
                            _buildSummaryRow('ID цикла', '#${cycle.cycleId}', context),
                            _buildSummaryRow('Символ', cycle.marketData.symbol, context),
                            _buildSummaryRow('Финальное действие', cycle.decision.action, context),
                            _buildSummaryRow(
                              'Уверенность',
                              '${(cycle.decision.confidence * 100).toInt()}%',
                              context,
                            ),
                            _buildSummaryRow('Статус исполнения', cycle.execution.status, context),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => AgentLogsScreen(cycle: cycle),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.article_outlined),
                                label: const Text('Посмотреть детальные логи'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80), // Space for FAB
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ref.read(tradingCycleProvider.notifier).runCycle(),
        label: const Text('Запустить цикл'),
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
