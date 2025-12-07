import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trade.dart';
import '../services/api_client.dart';
import 'trading_cycle_provider.dart';

// Trade History Notifier
class TradeHistoryNotifier extends StateNotifier<AsyncValue<List<Trade>>> {
  final ApiClient _apiClient;

  TradeHistoryNotifier(this._apiClient) : super(const AsyncValue.loading()) {
    loadHistory();
  }

  // Load trade history
  Future<void> loadHistory() async {
    state = const AsyncValue.loading();

    try {
      final history = await _apiClient.getTradeHistory();
      state = AsyncValue.data(history);
    } on DioException catch (e) {
      // Обработка сетевых ошибок
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        state = AsyncValue.error(
          'Превышено время ожидания при загрузке истории',
          StackTrace.current,
        );
      } else if (e.type == DioExceptionType.connectionError) {
        state = AsyncValue.error(
          'Ошибка подключения к серверу',
          StackTrace.current,
        );
      } else {
        state = AsyncValue.error(
          'Ошибка при загрузке истории: ${e.message}',
          StackTrace.current,
        );
      }
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
  final apiClient = ref.watch(apiClientProvider);
  return TradeHistoryNotifier(apiClient);
});
