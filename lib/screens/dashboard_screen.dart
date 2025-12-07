import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/trading_cycle_provider.dart';
import '../utils/constants.dart';
import '../widgets/agent_card.dart';
import '../widgets/agent_flow_indicator.dart';
import '../widgets/decision_card.dart';
import '../widgets/execution_card.dart';
import '../widgets/price_card.dart';
import 'agent_logs_screen.dart';
import 'settings_screen.dart';
import 'trade_history_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  final String symbol;

  const DashboardScreen({
    super.key,
    required this.symbol,
  });

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Run cycle automatically when entering this screen
    Future.microtask(() {
      ref.read(tradingCycleProvider.notifier).runCycle(symbol: widget.symbol);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cycleState = ref.watch(tradingCycleProvider);

    // Get crypto info for display
    final cryptoInfo = AppStrings.cryptoList.firstWhere(
      (crypto) => crypto.symbol == widget.symbol,
      orElse: () => AppStrings.cryptoList[0],
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: cryptoInfo.color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: cryptoInfo.imageUrl != null
                    ? Image.network(
                        cryptoInfo.imageUrl!,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return cryptoInfo.iconData != null
                              ? Icon(
                                  cryptoInfo.iconData,
                                  size: 20,
                                  color: cryptoInfo.color,
                                )
                              : Text(
                                  cryptoInfo.shortName[0],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: cryptoInfo.color,
                                  ),
                                );
                        },
                      )
                    : cryptoInfo.iconData != null
                        ? Icon(
                            cryptoInfo.iconData,
                            size: 20,
                            color: cryptoInfo.color,
                          )
                        : Text(
                            cryptoInfo.shortName[0],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: cryptoInfo.color,
                            ),
                          ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  cryptoInfo.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  cryptoInfo.shortName,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TradeHistoryScreen()),
              );
            },
            tooltip: 'Trade History',
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
            tooltip: 'About App',
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
                child: const Text('Retry'),
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
                    label: const Text('Start Trading Cycle'),
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
                      'Agent Communication',
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
                    input: 'Request to monitor ${cycle.marketData.symbol}',
                    action: 'Fetched price \$${cycle.marketData.price.toStringAsFixed(2)}, calculated indicators',
                    output: 'Data sent to Decision Maker (Price, SMA_10, SMA_50, RSI_14)',
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
                    input: 'Market data with indicators',
                    action: 'ML model predicted ${cycle.decision.action} (${(cycle.decision.confidence * 100).toInt()}%)',
                    output: 'Decision: ${cycle.decision.action} sent to Execution Agent',
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
                    input: 'Decision: ${cycle.decision.action}',
                    action: cycle.execution.executed
                        ? 'Simulating trade execution'
                        : 'Trade skipped (HOLD)',
                    output: 'Order ${cycle.execution.orderId}, Status: ${cycle.execution.status}',
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
                              'Cycle Summary',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Divider(),
                            _buildSummaryRow('Cycle ID', '#${cycle.cycleId}', context),
                            _buildSummaryRow('Symbol', cycle.marketData.symbol, context),
                            _buildSummaryRow('Final Action', cycle.decision.action, context),
                            _buildSummaryRow(
                              'Confidence',
                              '${(cycle.decision.confidence * 100).toInt()}%',
                              context,
                            ),
                            _buildSummaryRow('Execution Status', cycle.execution.status, context),
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
                                label: const Text('View Detailed Logs'),
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
        onPressed: () => ref.read(tradingCycleProvider.notifier).runCycle(symbol: widget.symbol),
        label: const Text('Start Cycle'),
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
