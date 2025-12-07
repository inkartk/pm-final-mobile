import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trading_cycle.dart';
import '../services/api_client.dart';
import '../services/dio_config.dart';

// API Client Provider
final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = DioConfig.createDio();
  return ApiClient(dio);
});

// Trading Cycle Notifier
class TradingCycleNotifier extends StateNotifier<AsyncValue<TradingCycleResponse?>> {
  final ApiClient _apiClient;

  TradingCycleNotifier(this._apiClient) : super(const AsyncValue.data(null));

  // Run a trading cycle
  Future<void> runCycle({String symbol = 'ETHUSDT'}) async {
    state = const AsyncValue.loading();

    try {
      final result = await _apiClient.runTradingCycle(symbol: symbol);
      state = AsyncValue.data(result);
    } on DioException catch (e) {
      // Обработка сетевых ошибок
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        state = AsyncValue.error(
          'Превышено время ожидания. Проверьте подключение к backend.',
          StackTrace.current,
        );
      } else if (e.type == DioExceptionType.connectionError) {
        state = AsyncValue.error(
          'Не удалось подключиться к серверу. Проверьте, запущен ли backend на http://10.0.2.2:8000',
          StackTrace.current,
        );
      } else {
        state = AsyncValue.error(
          'Ошибка сети: ${e.message}',
          StackTrace.current,
        );
      }
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
  final apiClient = ref.watch(apiClientProvider);
  return TradingCycleNotifier(apiClient);
});
