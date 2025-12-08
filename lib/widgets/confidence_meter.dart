import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../utils/formatters.dart';

class ConfidenceMeter extends StatelessWidget {
  final double confidence;

  const ConfidenceMeter({
    Key? key,
    required this.confidence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.getConfidenceColor(confidence);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Confidence',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              AppFormatters.formatConfidence(confidence),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: confidence,
            backgroundColor: Colors.grey[300],
            color: color,
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
