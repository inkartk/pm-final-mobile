// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'execution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Execution _$ExecutionFromJson(Map<String, dynamic> json) {
  return _Execution.fromJson(json);
}

/// @nodoc
mixin _$Execution {
  bool get executed => throw _privateConstructorUsedError;
  @JsonKey(name: 'execution_price')
  double get executionPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  /// Serializes this Execution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Execution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExecutionCopyWith<Execution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExecutionCopyWith<$Res> {
  factory $ExecutionCopyWith(Execution value, $Res Function(Execution) then) =
      _$ExecutionCopyWithImpl<$Res, Execution>;
  @useResult
  $Res call(
      {bool executed,
      @JsonKey(name: 'execution_price') double executionPrice,
      @JsonKey(name: 'order_id') String orderId,
      String status,
      DateTime time});
}

/// @nodoc
class _$ExecutionCopyWithImpl<$Res, $Val extends Execution>
    implements $ExecutionCopyWith<$Res> {
  _$ExecutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Execution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? executed = null,
    Object? executionPrice = null,
    Object? orderId = null,
    Object? status = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      executed: null == executed
          ? _value.executed
          : executed // ignore: cast_nullable_to_non_nullable
              as bool,
      executionPrice: null == executionPrice
          ? _value.executionPrice
          : executionPrice // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExecutionImplCopyWith<$Res>
    implements $ExecutionCopyWith<$Res> {
  factory _$$ExecutionImplCopyWith(
          _$ExecutionImpl value, $Res Function(_$ExecutionImpl) then) =
      __$$ExecutionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool executed,
      @JsonKey(name: 'execution_price') double executionPrice,
      @JsonKey(name: 'order_id') String orderId,
      String status,
      DateTime time});
}

/// @nodoc
class __$$ExecutionImplCopyWithImpl<$Res>
    extends _$ExecutionCopyWithImpl<$Res, _$ExecutionImpl>
    implements _$$ExecutionImplCopyWith<$Res> {
  __$$ExecutionImplCopyWithImpl(
      _$ExecutionImpl _value, $Res Function(_$ExecutionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Execution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? executed = null,
    Object? executionPrice = null,
    Object? orderId = null,
    Object? status = null,
    Object? time = null,
  }) {
    return _then(_$ExecutionImpl(
      executed: null == executed
          ? _value.executed
          : executed // ignore: cast_nullable_to_non_nullable
              as bool,
      executionPrice: null == executionPrice
          ? _value.executionPrice
          : executionPrice // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExecutionImpl implements _Execution {
  const _$ExecutionImpl(
      {required this.executed,
      @JsonKey(name: 'execution_price') required this.executionPrice,
      @JsonKey(name: 'order_id') required this.orderId,
      required this.status,
      required this.time});

  factory _$ExecutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExecutionImplFromJson(json);

  @override
  final bool executed;
  @override
  @JsonKey(name: 'execution_price')
  final double executionPrice;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  final String status;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'Execution(executed: $executed, executionPrice: $executionPrice, orderId: $orderId, status: $status, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExecutionImpl &&
            (identical(other.executed, executed) ||
                other.executed == executed) &&
            (identical(other.executionPrice, executionPrice) ||
                other.executionPrice == executionPrice) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, executed, executionPrice, orderId, status, time);

  /// Create a copy of Execution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExecutionImplCopyWith<_$ExecutionImpl> get copyWith =>
      __$$ExecutionImplCopyWithImpl<_$ExecutionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExecutionImplToJson(
      this,
    );
  }
}

abstract class _Execution implements Execution {
  const factory _Execution(
      {required final bool executed,
      @JsonKey(name: 'execution_price') required final double executionPrice,
      @JsonKey(name: 'order_id') required final String orderId,
      required final String status,
      required final DateTime time}) = _$ExecutionImpl;

  factory _Execution.fromJson(Map<String, dynamic> json) =
      _$ExecutionImpl.fromJson;

  @override
  bool get executed;
  @override
  @JsonKey(name: 'execution_price')
  double get executionPrice;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  String get status;
  @override
  DateTime get time;

  /// Create a copy of Execution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExecutionImplCopyWith<_$ExecutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
