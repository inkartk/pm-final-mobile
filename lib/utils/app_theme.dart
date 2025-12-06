import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.activeColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      cardTheme: CardTheme(
        color: AppColors.lightCardBackground,
        elevation: AppSizes.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
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
        backgroundColor: Colors.grey.shade200,
        labelStyle: const TextStyle(fontSize: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmall,
          vertical: 4,
        ),
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        space: 20,
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.activeColor,
        brightness: Brightness.dark,
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
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
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
        backgroundColor: Colors.grey.shade800,
        labelStyle: const TextStyle(fontSize: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmall,
          vertical: 4,
        ),
      ),
      dividerTheme: const DividerThemeData(
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
