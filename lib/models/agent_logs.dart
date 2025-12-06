import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_logs.freezed.dart';
part 'agent_logs.g.dart';

@freezed
class AgentLogs with _$AgentLogs {
  const factory AgentLogs({
    @JsonKey(name: 'market_agent') required String marketAgent,
    @JsonKey(name: 'decision_agent') required String decisionAgent,
    @JsonKey(name: 'execution_agent') required String executionAgent,
  }) = _AgentLogs;

  factory AgentLogs.fromJson(Map<String, dynamic> json) =>
      _$AgentLogsFromJson(json);
}
