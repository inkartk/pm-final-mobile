import 'package:freezed_annotation/freezed_annotation.dart';
import 'market_data.dart';
import 'decision.dart';
import 'execution.dart';
import 'agent_logs.dart';

part 'trading_cycle.freezed.dart';
part 'trading_cycle.g.dart';

@freezed
class TradingCycleResponse with _$TradingCycleResponse {
  const factory TradingCycleResponse({
    @JsonKey(name: 'cycle_id') required int cycleId,
    required DateTime timestamp,
    @JsonKey(name: 'market_data') required MarketData marketData,
    required Decision decision,
    required Execution execution,
    required AgentLogs logs,
  }) = _TradingCycleResponse;

  factory TradingCycleResponse.fromJson(Map<String, dynamic> json) =>
      _$TradingCycleResponseFromJson(json);
}
