// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentLogs _$AgentLogsFromJson(Map<String, dynamic> json) {
  return _AgentLogs.fromJson(json);
}

/// @nodoc
mixin _$AgentLogs {
  @JsonKey(name: 'market_agent')
  String get marketAgent => throw _privateConstructorUsedError;
  @JsonKey(name: 'decision_agent')
  String get decisionAgent => throw _privateConstructorUsedError;
  @JsonKey(name: 'execution_agent')
  String get executionAgent => throw _privateConstructorUsedError;

  /// Serializes this AgentLogs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentLogsCopyWith<AgentLogs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentLogsCopyWith<$Res> {
  factory $AgentLogsCopyWith(AgentLogs value, $Res Function(AgentLogs) then) =
      _$AgentLogsCopyWithImpl<$Res, AgentLogs>;
  @useResult
  $Res call(
      {@JsonKey(name: 'market_agent') String marketAgent,
      @JsonKey(name: 'decision_agent') String decisionAgent,
      @JsonKey(name: 'execution_agent') String executionAgent});
}

/// @nodoc
class _$AgentLogsCopyWithImpl<$Res, $Val extends AgentLogs>
    implements $AgentLogsCopyWith<$Res> {
  _$AgentLogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketAgent = null,
    Object? decisionAgent = null,
    Object? executionAgent = null,
  }) {
    return _then(_value.copyWith(
      marketAgent: null == marketAgent
          ? _value.marketAgent
          : marketAgent // ignore: cast_nullable_to_non_nullable
              as String,
      decisionAgent: null == decisionAgent
          ? _value.decisionAgent
          : decisionAgent // ignore: cast_nullable_to_non_nullable
              as String,
      executionAgent: null == executionAgent
          ? _value.executionAgent
          : executionAgent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentLogsImplCopyWith<$Res>
    implements $AgentLogsCopyWith<$Res> {
  factory _$$AgentLogsImplCopyWith(
          _$AgentLogsImpl value, $Res Function(_$AgentLogsImpl) then) =
      __$$AgentLogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'market_agent') String marketAgent,
      @JsonKey(name: 'decision_agent') String decisionAgent,
      @JsonKey(name: 'execution_agent') String executionAgent});
}

/// @nodoc
class __$$AgentLogsImplCopyWithImpl<$Res>
    extends _$AgentLogsCopyWithImpl<$Res, _$AgentLogsImpl>
    implements _$$AgentLogsImplCopyWith<$Res> {
  __$$AgentLogsImplCopyWithImpl(
      _$AgentLogsImpl _value, $Res Function(_$AgentLogsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketAgent = null,
    Object? decisionAgent = null,
    Object? executionAgent = null,
  }) {
    return _then(_$AgentLogsImpl(
      marketAgent: null == marketAgent
          ? _value.marketAgent
          : marketAgent // ignore: cast_nullable_to_non_nullable
              as String,
      decisionAgent: null == decisionAgent
          ? _value.decisionAgent
          : decisionAgent // ignore: cast_nullable_to_non_nullable
              as String,
      executionAgent: null == executionAgent
          ? _value.executionAgent
          : executionAgent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentLogsImpl implements _AgentLogs {
  const _$AgentLogsImpl(
      {@JsonKey(name: 'market_agent') required this.marketAgent,
      @JsonKey(name: 'decision_agent') required this.decisionAgent,
      @JsonKey(name: 'execution_agent') required this.executionAgent});

  factory _$AgentLogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentLogsImplFromJson(json);

  @override
  @JsonKey(name: 'market_agent')
  final String marketAgent;
  @override
  @JsonKey(name: 'decision_agent')
  final String decisionAgent;
  @override
  @JsonKey(name: 'execution_agent')
  final String executionAgent;

  @override
  String toString() {
    return 'AgentLogs(marketAgent: $marketAgent, decisionAgent: $decisionAgent, executionAgent: $executionAgent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentLogsImpl &&
            (identical(other.marketAgent, marketAgent) ||
                other.marketAgent == marketAgent) &&
            (identical(other.decisionAgent, decisionAgent) ||
                other.decisionAgent == decisionAgent) &&
            (identical(other.executionAgent, executionAgent) ||
                other.executionAgent == executionAgent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, marketAgent, decisionAgent, executionAgent);

  /// Create a copy of AgentLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentLogsImplCopyWith<_$AgentLogsImpl> get copyWith =>
      __$$AgentLogsImplCopyWithImpl<_$AgentLogsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentLogsImplToJson(
      this,
    );
  }
}

abstract class _AgentLogs implements AgentLogs {
  const factory _AgentLogs(
      {@JsonKey(name: 'market_agent') required final String marketAgent,
      @JsonKey(name: 'decision_agent') required final String decisionAgent,
      @JsonKey(name: 'execution_agent')
      required final String executionAgent}) = _$AgentLogsImpl;

  factory _AgentLogs.fromJson(Map<String, dynamic> json) =
      _$AgentLogsImpl.fromJson;

  @override
  @JsonKey(name: 'market_agent')
  String get marketAgent;
  @override
  @JsonKey(name: 'decision_agent')
  String get decisionAgent;
  @override
  @JsonKey(name: 'execution_agent')
  String get executionAgent;

  /// Create a copy of AgentLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentLogsImplCopyWith<_$AgentLogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
