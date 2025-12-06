import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class ActionBadge extends StatelessWidget {
  final String action;
  final double? fontSize;

  const ActionBadge({
    Key? key,
    required this.action,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.getActionColor(action);
    final icon = AppTheme.getActionIcon(action);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: fontSize ?? 16,
          ),
          const SizedBox(width: 6),
          Text(
            action,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
