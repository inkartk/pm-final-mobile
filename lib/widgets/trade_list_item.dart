import 'package:flutter/material.dart';
import '../models/trade.dart';
import '../utils/formatters.dart';
import '../utils/constants.dart';
import 'action_badge.dart';

class TradeListItem extends StatelessWidget {
  final Trade trade;
  final VoidCallback? onTap;

  const TradeListItem({
    Key? key,
    required this.trade,
    this.onTap,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (trade.status.toUpperCase()) {
      case 'FILLED':
        return AppColors.successColor;
      case 'SKIPPED':
        return AppColors.warningColor;
      case 'REJECTED':
        return AppColors.errorColor;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingMedium,
        vertical: AppSizes.paddingSmall,
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _getStatusColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getActionIcon(),
            color: _getStatusColor(),
          ),
        ),
        title: Row(
          children: [
            ActionBadge(action: trade.action, fontSize: 12),
            const SizedBox(width: 8),
            Text(
              trade.symbol,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Цена: ${AppFormatters.formatPrice(trade.executionPrice)}',
              style: const TextStyle(fontSize: 13),
            ),
            Text(
              AppFormatters.formatRelativeTime(trade.timestamp),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                trade.status,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '#${trade.id}',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getActionIcon() {
    switch (trade.action.toUpperCase()) {
      case 'BUY':
        return Icons.trending_up;
      case 'SELL':
        return Icons.trending_down;
      case 'HOLD':
        return Icons.trending_flat;
      default:
        return Icons.help_outline;
    }
  }
}
