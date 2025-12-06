import 'dart:math';
import '../models/trading_cycle.dart';
import '../models/market_data.dart';
import '../models/indicators.dart';
import '../models/decision.dart';
import '../models/execution.dart';
import '../models/agent_logs.dart';
import '../models/trade.dart';

class MockApiService {
  static int _cycleCounter = 0;
  static final List<Trade> _tradeHistory = [];
  static final Random _random = Random();

  // Simulate network delay
  Future<void> _simulateDelay() async {
    final delay = 800 + _random.nextInt(400); // 800-1200ms
    await Future.delayed(Duration(milliseconds: delay));
  }

  // Generate realistic price around $43,000 with variation
  double _generatePrice() {
    final basePrice = 43000.0;
    final variation = (_random.nextDouble() - 0.5) * 500; // ±$250
    return basePrice + variation;
  }

  // Calculate SMA (Simple Moving Average)
  double _calculateSMA(double price, double offset) {
    return price + (_random.nextDouble() - 0.5) * offset;
  }

  // Calculate RSI (Relative Strength Index)
  double _calculateRSI() {
    return 30 + _random.nextDouble() * 40; // 30-70 range
  }

  // Determine trading action based on price and indicators
  String _determineAction(double price, double sma50, double rsi) {
    if (price > sma50 && rsi < 65) {
      return 'BUY';
    } else if (price < sma50 && rsi > 55) {
      return 'SELL';
    } else {
      return 'HOLD';
    }
  }

  // Calculate confidence level
  double _calculateConfidence(String action) {
    if (action == 'HOLD') {
      return 0.60 + _random.nextDouble() * 0.15; // 60-75%
    } else {
      return 0.75 + _random.nextDouble() * 0.20; // 75-95%
    }
  }

  // Get reason for decision
  String _getDecisionReason(String action, double price, double sma50, double rsi) {
    switch (action) {
      case 'BUY':
        return 'Price (\$${price.toStringAsFixed(2)}) above SMA_50 (\$${sma50.toStringAsFixed(2)}), RSI at ${rsi.toStringAsFixed(1)} indicates positive trend';
      case 'SELL':
        return 'Price (\$${price.toStringAsFixed(2)}) below SMA_50 (\$${sma50.toStringAsFixed(2)}), RSI at ${rsi.toStringAsFixed(1)} suggests downward momentum';
      case 'HOLD':
        return 'Market conditions are neutral. Price near SMA_50, RSI at ${rsi.toStringAsFixed(1)} shows no clear trend';
      default:
        return 'No clear trading signal detected';
    }
  }

  // Run a complete trading cycle
  Future<TradingCycleResponse> runTradingCycle({String symbol = 'BTCUSDT'}) async {
    await _simulateDelay();

    _cycleCounter++;

    // Step 1: Market Monitor Agent - Generate market data
    final price = _generatePrice();
    final sma10 = _calculateSMA(price, 100);
    final sma50 = _calculateSMA(price, 200);
    final rsi = _calculateRSI();

    final indicators = Indicators(
      sma10: sma10,
      sma50: sma50,
      rsi14: rsi,
    );

    final marketData = MarketData(
      symbol: symbol,
      price: price,
      indicators: indicators,
      source: 'binance_mock',
    );

    // Step 2: Decision Maker Agent - Make trading decision
    final action = _determineAction(price, sma50, rsi);
    final confidence = _calculateConfidence(action);
    final reason = _getDecisionReason(action, price, sma50, rsi);

    final decision = Decision(
      action: action,
      confidence: confidence,
      modelVersion: 'v1.0.3',
      reason: reason,
    );

    // Step 3: Execution Agent - Execute trade
    final executionPrice = price + (_random.nextDouble() - 0.5) * 5; // slight slippage
    final orderId = 'ORD-${DateTime.now().millisecondsSinceEpoch}';
    final status = action == 'HOLD' ? 'SKIPPED' : 'FILLED';

    final execution = Execution(
      executed: action != 'HOLD',
      executionPrice: executionPrice,
      orderId: orderId,
      status: status,
      time: DateTime.now(),
    );

    // Create detailed agent logs showing communication
    final logs = AgentLogs(
      marketAgent: '''
← Received request to monitor $symbol
⚙ Fetching current price from Binance API...
⚙ Current price: \$${price.toStringAsFixed(2)}
⚙ Calculating technical indicators (SMA_10, SMA_50, RSI_14)
⚙ Indicators calculated: SMA_10=\$${sma10.toStringAsFixed(2)}, SMA_50=\$${sma50.toStringAsFixed(2)}, RSI_14=${rsi.toStringAsFixed(1)}
→ Sending market data to Decision Maker Agent
''',
      decisionAgent: '''
← Received market data from Market Monitor
  Symbol: $symbol, Price: \$${price.toStringAsFixed(2)}
  Indicators: SMA_10=\$${sma10.toStringAsFixed(2)}, SMA_50=\$${sma50.toStringAsFixed(2)}, RSI_14=${rsi.toStringAsFixed(1)}
⚙ Processing features through ML model (v1.0.3)
⚙ Feature vector prepared: [price, sma_10, sma_50, rsi_14, volume]
⚙ Model prediction: $action
⚙ Confidence score: ${(confidence * 100).toStringAsFixed(1)}%
⚙ Reasoning: $reason
→ Sending decision ($action, ${(confidence * 100).toStringAsFixed(1)}% confidence) to Execution Agent
''',
      executionAgent: '''
← Received trading decision from Decision Maker
  Action: $action
  Confidence: ${(confidence * 100).toStringAsFixed(1)}%
⚙ ${action == 'HOLD' ? 'Decision is HOLD, skipping execution' : 'Simulating trade execution for $action order'}
${action != 'HOLD' ? '⚙ Order placed at \$${executionPrice.toStringAsFixed(2)}' : ''}
${action != 'HOLD' ? '⚙ Order ID: $orderId' : ''}
${action != 'HOLD' ? '⚙ Order status: $status' : ''}
⚙ Logging trade to database...
✓ Trade ${action == 'HOLD' ? 'skipped and' : ''} recorded successfully
''',
    );

    // Add to trade history
    if (action != 'HOLD') {
      _tradeHistory.insert(
        0,
        Trade(
          id: _cycleCounter,
          symbol: symbol,
          action: action,
          price: price,
          executionPrice: executionPrice,
          timestamp: DateTime.now(),
          status: status,
          orderId: orderId,
        ),
      );
    }

    return TradingCycleResponse(
      cycleId: _cycleCounter,
      timestamp: DateTime.now(),
      marketData: marketData,
      decision: decision,
      execution: execution,
      logs: logs,
    );
  }

  // Get trade history
  Future<List<Trade>> getTradeHistory() async {
    await _simulateDelay();
    return List.from(_tradeHistory);
  }

  // Get latest market data only (without running full cycle)
  Future<MarketData> getLatestMarketData({String symbol = 'BTCUSDT'}) async {
    await _simulateDelay();

    final price = _generatePrice();
    final sma10 = _calculateSMA(price, 100);
    final sma50 = _calculateSMA(price, 200);
    final rsi = _calculateRSI();

    return MarketData(
      symbol: symbol,
      price: price,
      indicators: Indicators(
        sma10: sma10,
        sma50: sma50,
        rsi14: rsi,
      ),
      source: 'binance_mock',
    );
  }

  // Clear trade history (for testing)
  void clearHistory() {
    _tradeHistory.clear();
    _cycleCounter = 0;
  }
}
