// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_cycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TradingCycleResponseImpl _$$TradingCycleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TradingCycleResponseImpl(
      cycleId: (json['cycle_id'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      marketData:
          MarketData.fromJson(json['market_data'] as Map<String, dynamic>),
      decision: Decision.fromJson(json['decision'] as Map<String, dynamic>),
      execution: Execution.fromJson(json['execution'] as Map<String, dynamic>),
      logs: AgentLogs.fromJson(json['logs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TradingCycleResponseImplToJson(
        _$TradingCycleResponseImpl instance) =>
    <String, dynamic>{
      'cycle_id': instance.cycleId,
      'timestamp': instance.timestamp.toIso8601String(),
      'market_data': instance.marketData,
      'decision': instance.decision,
      'execution': instance.execution,
      'logs': instance.logs,
    };
