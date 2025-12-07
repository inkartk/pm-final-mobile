import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class CryptoInfo {
  final String symbol;
  final String name;
  final String shortName;
  final IconData? iconData;
  final String? imageUrl;
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
  static const Color buyColor = Color(0xFF00E676);
  static const Color sellColor = Color(0xFFFF1744); 
  static const Color holdColor = Color(0xFFFFC107); 
  static const Color activeColor = Color(0xFF00BFA5); 
  static const Color completedColor = Color(0xFF00E676); 

  static const Color successColor = Color(0xFF00E676);
  static const Color errorColor = Color(0xFFFF1744);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color infoColor = Color(0xFF00BFA5);

  static const Color confidenceHigh = Color(0xFF00E676); 
  static const Color confidenceMedium = Color(0xFFFF9800);
  static const Color confidenceLow = Color(0xFFFF1744); 

  static const Color darkBackground = Color(0xFF0A0E27);
  static const Color darkCardBackground = Color(0xFF1A1F3A);
  static const Color darkCardBackgroundHighlight = Color(0xFF252B4A);
}

class AppSizes {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;

  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 48.0;

  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  static const double flowStepSize = 50.0;
  static const double flowArrowSize = 24.0;
}

class AppStrings {
  static const String appName = 'Multi-Agent Trading System';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'A Flutter application demonstrating a multi-agent AI trading system';

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

  static const String marketMonitorAgent = 'Market Monitoring Agent';
  static const String decisionMakerAgent = 'Decision-Making Agent';
  static const String executionAgent = 'Execution Agent';

  static const String statusActive = 'Active';
  static const String statusProcessing = 'Processing';
  static const String statusCompleted = 'Completed';
  static const String statusFailed = 'Failed';
  static const String statusFilled = 'FILLED';
  static const String statusSkipped = 'SKIPPED';
  static const String statusRejected = 'REJECTED';

  static const String actionBuy = 'BUY';
  static const String actionSell = 'SELL';
  static const String actionHold = 'HOLD';

  static const String emptyStateMessage =
      'Press the button to start\na trading cycle';
  static const String loadingMessage = 'Starting trading cycle...';
  static const String errorMessage = 'An error occurred';
  static const String noTradesMessage = 'No trades in history';
}

class AppDurations {
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  static const Duration networkDelayMin = Duration(milliseconds: 800);
  static const Duration networkDelayMax = Duration(milliseconds: 1200);

  static const Duration autoRefreshInterval = Duration(seconds: 30);
}
