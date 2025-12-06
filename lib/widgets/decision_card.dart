import 'package:flutter/material.dart';
import '../models/decision.dart';
import '../utils/constants.dart';
import 'action_badge.dart';
import 'confidence_meter.dart';

class DecisionCard extends StatelessWidget {
  final Decision decision;

  const DecisionCard({
    Key? key,
    required this.decision,
  }) : super(key: key);

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
                  'Решение AI',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ActionBadge(action: decision.action),
              ],
            ),
            const SizedBox(height: 16),
            ConfidenceMeter(confidence: decision.confidence),
            const SizedBox(height: 12),
            Text(
              'Причина:',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 4),
            Text(
              decision.reason,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Версия модели: ${decision.modelVersion}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
