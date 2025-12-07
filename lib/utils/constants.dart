import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

// Crypto Info Model
class CryptoInfo {
  final String symbol;
  final String name;
  final String shortName;
  final IconData? iconData; // Icon from crypto_font_icons package
  final String? imageUrl; // Network image URL as fallback
  final Color color;

  const CryptoInfo({
    required this.symbol,
    required this.name,
    required this.shortName,
    this.iconData,
    this.imageUrl,
    required this.color,
  });
}

class AppColors {
  // Action Colors
  static const Color buyColor = Color(0xFF00E676); // Bright Green
  static const Color sellColor = Color(0xFFFF1744); // Bright Red
  static const Color holdColor = Color(0xFFFFC107); // Amber/Yellow
  static const Color activeColor = Color(0xFF00BFA5); // Teal/Cyan
  static const Color completedColor = Color(0xFF00E676); // Bright Green

  // Status Colors
  static const Color successColor = Color(0xFF00E676);
  static const Color errorColor = Color(0xFFFF1744);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color infoColor = Color(0xFF00BFA5);

  // Confidence Colors
  static const Color confidenceHigh = Color(0xFF00E676); // > 75%
  static const Color confidenceMedium = Color(0xFFFF9800); // 50-75%
  static const Color confidenceLow = Color(0xFFFF1744); // < 50%

  // Background Colors (dark theme only)
  static const Color darkBackground = Color(0xFF0A0E27);
  static const Color darkCardBackground = Color(0xFF1A1F3A);
  static const Color darkCardBackgroundHighlight = Color(0xFF252B4A);
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

  // Crypto List
  static const List<CryptoInfo> cryptoList = [
    CryptoInfo(
      symbol: 'BTCUSDT',
      name: 'Bitcoin',
      shortName: 'BTC',
      iconData: CryptoFontIcons.BTC,
      imageUrl: 'https://cryptologos.cc/logos/bitcoin-btc-logo.png',
      color: Color(0xFFF7931A),
    ),
    CryptoInfo(
      symbol: 'ETHUSDT',
      name: 'Ethereum',
      shortName: 'ETH',
      iconData: CryptoFontIcons.ETH,
      imageUrl: 'https://cryptologos.cc/logos/ethereum-eth-logo.png',
      color: Color(0xFF627EEA),
    ),
    CryptoInfo(
      symbol: 'BNBUSDT',
      name: 'Binance Coin',
      shortName: 'BNB',
      imageUrl: 'https://cryptologos.cc/logos/bnb-bnb-logo.png',
      color: Color(0xFFF3BA2F),
    ),
    CryptoInfo(
      symbol: 'SOLUSDT',
      name: 'Solana',
      shortName: 'SOL',
      imageUrl: 'https://cryptologos.cc/logos/solana-sol-logo.png',
      color: Color(0xFF14F195),
    ),
    CryptoInfo(
      symbol: 'ADAUSDT',
      name: 'Cardano',
      shortName: 'ADA',
      imageUrl: 'https://cryptologos.cc/logos/cardano-ada-logo.png',
      color: Color(0xFF0033AD),
    ),
    CryptoInfo(
      symbol: 'DOGEUSDT',
      name: 'Dogecoin',
      shortName: 'DOGE',
      iconData: CryptoFontIcons.DOGE,
      imageUrl: 'https://cryptologos.cc/logos/dogecoin-doge-logo.png',
      color: Color(0xFFC2A633),
    ),
    CryptoInfo(
      symbol: 'MATICUSDT',
      name: 'Polygon',
      shortName: 'MATIC',
      imageUrl: 'https://cryptologos.cc/logos/polygon-matic-logo.png',
      color: Color(0xFF8247E5),
    ),
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
      'Press the button to start\na trading cycle';
  static const String loadingMessage = 'Starting trading cycle...';
  static const String errorMessage = 'An error occurred';
  static const String noTradesMessage = 'No trades in history';
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
