import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/market_data.dart';
import '../models/trade.dart';
import '../models/trading_cycle.dart';

part 'api_client.g.dart';

/// Retrofit API Client for Trading Backend
///
/// Provides type-safe HTTP API calls to the Python FastAPI backend
@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// Run a complete trading cycle (monitor → decide → execute)
  ///
  /// POST /trading/run-cycle?symbol=BTCUSDT
  ///
  /// Returns [TradingCycleResponse] with market data, decision, and execution
  @POST('/trading/run-cycle')
  Future<TradingCycleResponse> runTradingCycle({
    @Query('symbol') String symbol = 'ETHUSDT',
  });

  /// Get trade history
  ///
  /// GET /trading/trades
  ///
  /// Returns list of past trades
  @GET('/trading/trades')
  Future<List<Trade>> getTradeHistory();

  /// Get latest market data without running full cycle
  ///
  /// GET /trading/market/latest?symbol=BTCUSDT
  ///
  /// Returns [MarketData] with current price and indicators
  @GET('/trading/market/latest')
  Future<MarketData> getLatestMarketData({
    @Query('symbol') String symbol = 'ETHUSDT',
  });
}
