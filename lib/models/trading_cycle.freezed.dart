// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trading_cycle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TradingCycleResponse _$TradingCycleResponseFromJson(Map<String, dynamic> json) {
  return _TradingCycleResponse.fromJson(json);
}

/// @nodoc
mixin _$TradingCycleResponse {
  @JsonKey(name: 'cycle_id')
  int get cycleId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_data')
  MarketData get marketData => throw _privateConstructorUsedError;
  Decision get decision => throw _privateConstructorUsedError;
  Execution get execution => throw _privateConstructorUsedError;
  AgentLogs get logs => throw _privateConstructorUsedError;

  /// Serializes this TradingCycleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TradingCycleResponseCopyWith<TradingCycleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradingCycleResponseCopyWith<$Res> {
  factory $TradingCycleResponseCopyWith(TradingCycleResponse value,
          $Res Function(TradingCycleResponse) then) =
      _$TradingCycleResponseCopyWithImpl<$Res, TradingCycleResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cycle_id') int cycleId,
      DateTime timestamp,
      @JsonKey(name: 'market_data') MarketData marketData,
      Decision decision,
      Execution execution,
      AgentLogs logs});

  $MarketDataCopyWith<$Res> get marketData;
  $DecisionCopyWith<$Res> get decision;
  $ExecutionCopyWith<$Res> get execution;
  $AgentLogsCopyWith<$Res> get logs;
}

/// @nodoc
class _$TradingCycleResponseCopyWithImpl<$Res,
        $Val extends TradingCycleResponse>
    implements $TradingCycleResponseCopyWith<$Res> {
  _$TradingCycleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cycleId = null,
    Object? timestamp = null,
    Object? marketData = null,
    Object? decision = null,
    Object? execution = null,
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      cycleId: null == cycleId
          ? _value.cycleId
          : cycleId // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      marketData: null == marketData
          ? _value.marketData
          : marketData // ignore: cast_nullable_to_non_nullable
              as MarketData,
      decision: null == decision
          ? _value.decision
          : decision // ignore: cast_nullable_to_non_nullable
              as Decision,
      execution: null == execution
          ? _value.execution
          : execution // ignore: cast_nullable_to_non_nullable
              as Execution,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as AgentLogs,
    ) as $Val);
  }

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MarketDataCopyWith<$Res> get marketData {
    return $MarketDataCopyWith<$Res>(_value.marketData, (value) {
      return _then(_value.copyWith(marketData: value) as $Val);
    });
  }

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DecisionCopyWith<$Res> get decision {
    return $DecisionCopyWith<$Res>(_value.decision, (value) {
      return _then(_value.copyWith(decision: value) as $Val);
    });
  }

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExecutionCopyWith<$Res> get execution {
    return $ExecutionCopyWith<$Res>(_value.execution, (value) {
      return _then(_value.copyWith(execution: value) as $Val);
    });
  }

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentLogsCopyWith<$Res> get logs {
    return $AgentLogsCopyWith<$Res>(_value.logs, (value) {
      return _then(_value.copyWith(logs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TradingCycleResponseImplCopyWith<$Res>
    implements $TradingCycleResponseCopyWith<$Res> {
  factory _$$TradingCycleResponseImplCopyWith(_$TradingCycleResponseImpl value,
          $Res Function(_$TradingCycleResponseImpl) then) =
      __$$TradingCycleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cycle_id') int cycleId,
      DateTime timestamp,
      @JsonKey(name: 'market_data') MarketData marketData,
      Decision decision,
      Execution execution,
      AgentLogs logs});

  @override
  $MarketDataCopyWith<$Res> get marketData;
  @override
  $DecisionCopyWith<$Res> get decision;
  @override
  $ExecutionCopyWith<$Res> get execution;
  @override
  $AgentLogsCopyWith<$Res> get logs;
}

/// @nodoc
class __$$TradingCycleResponseImplCopyWithImpl<$Res>
    extends _$TradingCycleResponseCopyWithImpl<$Res, _$TradingCycleResponseImpl>
    implements _$$TradingCycleResponseImplCopyWith<$Res> {
  __$$TradingCycleResponseImplCopyWithImpl(_$TradingCycleResponseImpl _value,
      $Res Function(_$TradingCycleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cycleId = null,
    Object? timestamp = null,
    Object? marketData = null,
    Object? decision = null,
    Object? execution = null,
    Object? logs = null,
  }) {
    return _then(_$TradingCycleResponseImpl(
      cycleId: null == cycleId
          ? _value.cycleId
          : cycleId // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      marketData: null == marketData
          ? _value.marketData
          : marketData // ignore: cast_nullable_to_non_nullable
              as MarketData,
      decision: null == decision
          ? _value.decision
          : decision // ignore: cast_nullable_to_non_nullable
              as Decision,
      execution: null == execution
          ? _value.execution
          : execution // ignore: cast_nullable_to_non_nullable
              as Execution,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as AgentLogs,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TradingCycleResponseImpl implements _TradingCycleResponse {
  const _$TradingCycleResponseImpl(
      {@JsonKey(name: 'cycle_id') required this.cycleId,
      required this.timestamp,
      @JsonKey(name: 'market_data') required this.marketData,
      required this.decision,
      required this.execution,
      required this.logs});

  factory _$TradingCycleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TradingCycleResponseImplFromJson(json);

  @override
  @JsonKey(name: 'cycle_id')
  final int cycleId;
  @override
  final DateTime timestamp;
  @override
  @JsonKey(name: 'market_data')
  final MarketData marketData;
  @override
  final Decision decision;
  @override
  final Execution execution;
  @override
  final AgentLogs logs;

  @override
  String toString() {
    return 'TradingCycleResponse(cycleId: $cycleId, timestamp: $timestamp, marketData: $marketData, decision: $decision, execution: $execution, logs: $logs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradingCycleResponseImpl &&
            (identical(other.cycleId, cycleId) || other.cycleId == cycleId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.marketData, marketData) ||
                other.marketData == marketData) &&
            (identical(other.decision, decision) ||
                other.decision == decision) &&
            (identical(other.execution, execution) ||
                other.execution == execution) &&
            (identical(other.logs, logs) || other.logs == logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, cycleId, timestamp, marketData, decision, execution, logs);

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TradingCycleResponseImplCopyWith<_$TradingCycleResponseImpl>
      get copyWith =>
          __$$TradingCycleResponseImplCopyWithImpl<_$TradingCycleResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TradingCycleResponseImplToJson(
      this,
    );
  }
}

abstract class _TradingCycleResponse implements TradingCycleResponse {
  const factory _TradingCycleResponse(
      {@JsonKey(name: 'cycle_id') required final int cycleId,
      required final DateTime timestamp,
      @JsonKey(name: 'market_data') required final MarketData marketData,
      required final Decision decision,
      required final Execution execution,
      required final AgentLogs logs}) = _$TradingCycleResponseImpl;

  factory _TradingCycleResponse.fromJson(Map<String, dynamic> json) =
      _$TradingCycleResponseImpl.fromJson;

  @override
  @JsonKey(name: 'cycle_id')
  int get cycleId;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(name: 'market_data')
  MarketData get marketData;
  @override
  Decision get decision;
  @override
  Execution get execution;
  @override
  AgentLogs get logs;

  /// Create a copy of TradingCycleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TradingCycleResponseImplCopyWith<_$TradingCycleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
