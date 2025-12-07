// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decision.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Decision _$DecisionFromJson(Map<String, dynamic> json) {
  return _Decision.fromJson(json);
}

/// @nodoc
mixin _$Decision {
  String get action => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'model_version')
  String? get modelVersion => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this Decision to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DecisionCopyWith<Decision> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecisionCopyWith<$Res> {
  factory $DecisionCopyWith(Decision value, $Res Function(Decision) then) =
      _$DecisionCopyWithImpl<$Res, Decision>;
  @useResult
  $Res call(
      {String action,
      double confidence,
      @JsonKey(name: 'model_version') String? modelVersion,
      String reason});
}

/// @nodoc
class _$DecisionCopyWithImpl<$Res, $Val extends Decision>
    implements $DecisionCopyWith<$Res> {
  _$DecisionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? confidence = null,
    Object? modelVersion = freezed,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      modelVersion: freezed == modelVersion
          ? _value.modelVersion
          : modelVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DecisionImplCopyWith<$Res>
    implements $DecisionCopyWith<$Res> {
  factory _$$DecisionImplCopyWith(
          _$DecisionImpl value, $Res Function(_$DecisionImpl) then) =
      __$$DecisionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String action,
      double confidence,
      @JsonKey(name: 'model_version') String? modelVersion,
      String reason});
}

/// @nodoc
class __$$DecisionImplCopyWithImpl<$Res>
    extends _$DecisionCopyWithImpl<$Res, _$DecisionImpl>
    implements _$$DecisionImplCopyWith<$Res> {
  __$$DecisionImplCopyWithImpl(
      _$DecisionImpl _value, $Res Function(_$DecisionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? confidence = null,
    Object? modelVersion = freezed,
    Object? reason = null,
  }) {
    return _then(_$DecisionImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      modelVersion: freezed == modelVersion
          ? _value.modelVersion
          : modelVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DecisionImpl implements _Decision {
  const _$DecisionImpl(
      {required this.action,
      required this.confidence,
      @JsonKey(name: 'model_version') this.modelVersion,
      required this.reason});

  factory _$DecisionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DecisionImplFromJson(json);

  @override
  final String action;
  @override
  final double confidence;
  @override
  @JsonKey(name: 'model_version')
  final String? modelVersion;
  @override
  final String reason;

  @override
  String toString() {
    return 'Decision(action: $action, confidence: $confidence, modelVersion: $modelVersion, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecisionImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, action, confidence, modelVersion, reason);

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DecisionImplCopyWith<_$DecisionImpl> get copyWith =>
      __$$DecisionImplCopyWithImpl<_$DecisionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DecisionImplToJson(
      this,
    );
  }
}

abstract class _Decision implements Decision {
  const factory _Decision(
      {required final String action,
      required final double confidence,
      @JsonKey(name: 'model_version') final String? modelVersion,
      required final String reason}) = _$DecisionImpl;

  factory _Decision.fromJson(Map<String, dynamic> json) =
      _$DecisionImpl.fromJson;

  @override
  String get action;
  @override
  double get confidence;
  @override
  @JsonKey(name: 'model_version')
  String? get modelVersion;
  @override
  String get reason;

  /// Create a copy of Decision
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DecisionImplCopyWith<_$DecisionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
