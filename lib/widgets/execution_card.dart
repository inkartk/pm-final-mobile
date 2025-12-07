import 'package:flutter/material.dart';
import '../models/execution.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';

class ExecutionCard extends StatelessWidget {
  final Execution execution;

  const ExecutionCard({
    Key? key,
    required this.execution,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (execution.status.toUpperCase()) {
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
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trade Execution',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    execution.status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (execution.executed) ...[
              _buildInfoRow(
                'Execution Price',
                AppFormatters.formatPrice(execution.executionPrice),
                context,
              ),
              const SizedBox(height: 8),
            ],
            _buildInfoRow(
              'Order ID',
              execution.orderId,
              context,
            ),
            const SizedBox(height: 8),
            _buildInfoRow(
              'Time',
              AppFormatters.formatTime(execution.time),
              context,
            ),
            if (!execution.executed) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.holdColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.holdColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: AppColors.holdColor, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Trade was not executed (HOLD)',
                        style: TextStyle(
                          color: AppColors.holdColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
