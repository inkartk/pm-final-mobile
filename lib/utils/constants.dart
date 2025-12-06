import 'package:flutter/material.dart';

class AppColors {
  // Action Colors
  static const Color buyColor = Color(0xFF4CAF50); // Green
  static const Color sellColor = Color(0xFFF44336); // Red
  static const Color holdColor = Color(0xFFFFC107); // Amber/Yellow
  static const Color activeColor = Color(0xFF2196F3); // Blue
  static const Color completedColor = Color(0xFF4CAF50); // Green

  // Status Colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFF44336);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color infoColor = Color(0xFF2196F3);

  // Confidence Colors
  static const Color confidenceHigh = Color(0xFF4CAF50); // > 75%
  static const Color confidenceMedium = Color(0xFFFF9800); // 50-75%
  static const Color confidenceLow = Color(0xFFF44336); // < 50%

  // Background Colors (for light theme)
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightCardBackground = Colors.white;

  // Background Colors (for dark theme)
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCardBackground = Color(0xFF1E1E1E);
}

class AppSizes {
  // Padding & Margin
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;

  // Icon Sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 48.0;

  // Card Elevation
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // Flow Indicator
  static const double flowStepSize = 50.0;
  static const double flowArrowSize = 24.0;
}

class AppStrings {
  // App Info
  static const String appName = 'Multi-Agent Trading System';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'A Flutter application demonstrating a multi-agent AI trading system';

  // Symbols
  static const List<String> tradingSymbols = [
    'BTCUSDT',
    'ETHUSDT',
    'BNBUSDT',
    'SOLUSDT',
  ];

  // Agent Names
  static const String marketMonitorAgent = 'Market Monitoring Agent';
  static const String decisionMakerAgent = 'Decision-Making Agent';
  static const String executionAgent = 'Execution Agent';

  // Status
  static const String statusActive = 'Active';
  static const String statusProcessing = 'Processing';
  static const String statusCompleted = 'Completed';
  static const String statusFailed = 'Failed';
  static const String statusFilled = 'FILLED';
  static const String statusSkipped = 'SKIPPED';
  static const String statusRejected = 'REJECTED';

  // Actions
  static const String actionBuy = 'BUY';
  static const String actionSell = 'SELL';
  static const String actionHold = 'HOLD';

  // Messages
  static const String emptyStateMessage =
      'Нажмите кнопку чтобы запустить\nторговый цикл';
  static const String loadingMessage = 'Запуск торгового цикла...';
  static const String errorMessage = 'Произошла ошибка';
  static const String noTradesMessage = 'Нет сделок в истории';
}

class AppDurations {
  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Network Delays (for mock API)
  static const Duration networkDelayMin = Duration(milliseconds: 800);
  static const Duration networkDelayMax = Duration(milliseconds: 1200);

  // Auto-refresh
  static const Duration autoRefreshInterval = Duration(seconds: 30);
}
