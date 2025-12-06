// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentLogsImpl _$$AgentLogsImplFromJson(Map<String, dynamic> json) =>
    _$AgentLogsImpl(
      marketAgent: json['market_agent'] as String,
      decisionAgent: json['decision_agent'] as String,
      executionAgent: json['execution_agent'] as String,
    );

Map<String, dynamic> _$$AgentLogsImplToJson(_$AgentLogsImpl instance) =>
    <String, dynamic>{
      'market_agent': instance.marketAgent,
      'decision_agent': instance.decisionAgent,
      'execution_agent': instance.executionAgent,
    };
