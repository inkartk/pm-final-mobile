import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/trade_history_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../widgets/trade_list_item.dart';

class TradeHistoryScreen extends ConsumerStatefulWidget {
  const TradeHistoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TradeHistoryScreen> createState() => _TradeHistoryScreenState();
}

class _TradeHistoryScreenState extends ConsumerState<TradeHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tradeHistoryProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final historyState = ref.watch(tradeHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('История сделок'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(tradeHistoryProvider.notifier).refresh(),
            tooltip: 'Обновить',
          ),
        ],
      ),
      body: historyState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
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
              Text('Ошибка: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(tradeHistoryProvider.notifier).refresh(),
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
        data: (trades) {
          if (trades.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppStrings.noTradesMessage,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(tradeHistoryProvider.notifier).refresh(),
            child: ListView.builder(
              itemCount: trades.length,
              padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingSmall),
              itemBuilder: (context, index) {
                final trade = trades[index];
                return TradeListItem(
                  trade: trade,
                  onTap: () => _showTradeDetails(context, trade),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showTradeDetails(BuildContext context, trade) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppSizes.paddingLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Детали сделки #${trade.id}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 8),
            _buildDetailRow('Символ', trade.symbol),
            _buildDetailRow('Действие', trade.action),
            _buildDetailRow('Цена маркета', AppFormatters.formatPrice(trade.price)),
            _buildDetailRow('Цена исполнения', AppFormatters.formatPrice(trade.executionPrice)),
            _buildDetailRow('Статус', trade.status),
            _buildDetailRow('ID ордера', trade.orderId),
            _buildDetailRow('Время', AppFormatters.formatDateTime(trade.timestamp)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
