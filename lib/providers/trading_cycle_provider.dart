import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trading_cycle.dart';
import '../services/mock_api_service.dart';

// Mock API Service Provider
final mockApiServiceProvider = Provider<MockApiService>((ref) {
  return MockApiService();
});

// Trading Cycle Notifier
class TradingCycleNotifier extends StateNotifier<AsyncValue<TradingCycleResponse?>> {
  final MockApiService _apiService;

  TradingCycleNotifier(this._apiService) : super(const AsyncValue.data(null));

  // Run a trading cycle
  Future<void> runCycle({String symbol = 'BTCUSDT'}) async {
    state = const AsyncValue.loading();

    try {
      final result = await _apiService.runTradingCycle(symbol: symbol);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // Refresh the current cycle
  Future<void> refresh() async {
    if (state.value != null) {
      final currentSymbol = state.value!.marketData.symbol;
      await runCycle(symbol: currentSymbol);
    } else {
      await runCycle();
    }
  }
}

// Trading Cycle Provider
final tradingCycleProvider =
    StateNotifierProvider<TradingCycleNotifier, AsyncValue<TradingCycleResponse?>>((ref) {
  final apiService = ref.watch(mockApiServiceProvider);
  return TradingCycleNotifier(apiService);
});
