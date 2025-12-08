import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/market_data.dart';
import '../models/trade.dart';
import '../models/trading_cycle.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/trading/run-cycle')
  Future<TradingCycleResponse> runTradingCycle({
    @Query('symbol') String symbol = 'ETHUSDT',
  });

  @GET('/trading/trades')
  Future<List<Trade>> getTradeHistory();
  
}
