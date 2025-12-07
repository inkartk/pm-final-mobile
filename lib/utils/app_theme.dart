import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  // Dark Theme (only theme)
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.activeColor,
        brightness: Brightness.dark,
        primary: AppColors.activeColor,
        secondary: AppColors.activeColor,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardTheme: CardTheme(
        color: AppColors.darkCardBackground,
        elevation: AppSizes.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkCardBackground,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.activeColor,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.activeColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingLarge,
            vertical: AppSizes.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkCardBackgroundHighlight,
        labelStyle: const TextStyle(fontSize: 12, color: Colors.white),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmall,
          vertical: 4,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withOpacity(0.1),
        thickness: 1,
        space: 20,
      ),
    );
  }

  // Get color for trading action
  static Color getActionColor(String action) {
    switch (action.toUpperCase()) {
      case 'BUY':
        return AppColors.buyColor;
      case 'SELL':
        return AppColors.sellColor;
      case 'HOLD':
        return AppColors.holdColor;
      default:
        return Colors.grey;
    }
  }

  // Get color for confidence level
  static Color getConfidenceColor(double confidence) {
    if (confidence > 0.75) {
      return AppColors.confidenceHigh;
    } else if (confidence > 0.50) {
      return AppColors.confidenceMedium;
    } else {
      return AppColors.confidenceLow;
    }
  }

  // Get icon for trading action
  static IconData getActionIcon(String action) {
    switch (action.toUpperCase()) {
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
