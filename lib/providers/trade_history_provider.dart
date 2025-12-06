import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trade.dart';
import '../services/mock_api_service.dart';
import 'trading_cycle_provider.dart';

// Trade History Notifier
class TradeHistoryNotifier extends StateNotifier<AsyncValue<List<Trade>>> {
  final MockApiService _apiService;

  TradeHistoryNotifier(this._apiService) : super(const AsyncValue.loading()) {
    loadHistory();
  }

  // Load trade history
  Future<void> loadHistory() async {
    state = const AsyncValue.loading();

    try {
      final history = await _apiService.getTradeHistory();
      state = AsyncValue.data(history);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // Refresh history
  Future<void> refresh() async {
    await loadHistory();
  }
}

// Trade History Provider
final tradeHistoryProvider =
    StateNotifierProvider<TradeHistoryNotifier, AsyncValue<List<Trade>>>((ref) {
  final apiService = ref.watch(mockApiServiceProvider);
  return TradeHistoryNotifier(apiService);
});
