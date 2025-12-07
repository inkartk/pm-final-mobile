import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AgentCard extends StatelessWidget {
  final String agentName;
  final String status;
  final String input;
  final String output;
  final String action;
  final Color statusColor;
  final bool isActive;

  const AgentCard({
    Key? key,
    required this.agentName,
    required this.status,
    required this.input,
    required this.output,
    required this.action,
    required this.statusColor,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isActive ? AppSizes.elevationHigh : AppSizes.elevationLow,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingMedium,
        vertical: AppSizes.paddingSmall,
      ),
      color: isActive ? Colors.blue.shade50 : null,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    agentName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildDataRow('← Input:', input, Icons.arrow_downward, context),
            const SizedBox(height: 8),
            _buildDataRow('⚙ Action:', action, Icons.settings, context),
            const SizedBox(height: 8),
            _buildDataRow('→ Output:', output, Icons.arrow_upward, context),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value, IconData icon, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.87)
                    : Colors.black.withOpacity(0.87),
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: '$label ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
