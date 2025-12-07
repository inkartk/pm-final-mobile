import 'package:flutter/material.dart';
import '../models/market_data.dart';
import '../utils/formatters.dart';
import '../utils/constants.dart';

class PriceCard extends StatelessWidget {
  final MarketData marketData;

  const PriceCard({
    Key? key,
    required this.marketData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppSizes.paddingMedium),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              marketData.symbol,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              AppFormatters.formatPrice(marketData.price),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.activeColor,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Source: ${marketData.source}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Divider(height: 24),
            Text(
              'Technical Indicators',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            _buildIndicatorRow(
              'SMA 10',
              AppFormatters.formatPrice(marketData.indicators.sma10),
              context,
            ),
            const SizedBox(height: 8),
            _buildIndicatorRow(
              'SMA 50',
              AppFormatters.formatPrice(marketData.indicators.sma50),
              context,
            ),
            const SizedBox(height: 8),
            _buildIndicatorRow(
              'RSI 14',
              AppFormatters.formatIndicator(marketData.indicators.rsi14),
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorRow(String label, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
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
