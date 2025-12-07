// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indicators.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Indicators _$IndicatorsFromJson(Map<String, dynamic> json) {
  return _Indicators.fromJson(json);
}

/// @nodoc
mixin _$Indicators {
  @JsonKey(name: 'sma_10')
  double get sma10 => throw _privateConstructorUsedError;
  @JsonKey(name: 'sma_50')
  double get sma50 => throw _privateConstructorUsedError;
  @JsonKey(name: 'rsi_14')
  double get rsi14 => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_price')
  double? get currentPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_1m')
  double? get priceChange1m => throw _privateConstructorUsedError;

  /// Serializes this Indicators to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Indicators
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IndicatorsCopyWith<Indicators> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndicatorsCopyWith<$Res> {
  factory $IndicatorsCopyWith(
          Indicators value, $Res Function(Indicators) then) =
      _$IndicatorsCopyWithImpl<$Res, Indicators>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sma_10') double sma10,
      @JsonKey(name: 'sma_50') double sma50,
      @JsonKey(name: 'rsi_14') double rsi14,
      @JsonKey(name: 'current_price') double? currentPrice,
      @JsonKey(name: 'price_change_1m') double? priceChange1m});
}

/// @nodoc
class _$IndicatorsCopyWithImpl<$Res, $Val extends Indicators>
    implements $IndicatorsCopyWith<$Res> {
  _$IndicatorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Indicators
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sma10 = null,
    Object? sma50 = null,
    Object? rsi14 = null,
    Object? currentPrice = freezed,
    Object? priceChange1m = freezed,
  }) {
    return _then(_value.copyWith(
      sma10: null == sma10
          ? _value.sma10
          : sma10 // ignore: cast_nullable_to_non_nullable
              as double,
      sma50: null == sma50
          ? _value.sma50
          : sma50 // ignore: cast_nullable_to_non_nullable
              as double,
      rsi14: null == rsi14
          ? _value.rsi14
          : rsi14 // ignore: cast_nullable_to_non_nullable
              as double,
      currentPrice: freezed == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange1m: freezed == priceChange1m
          ? _value.priceChange1m
          : priceChange1m // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndicatorsImplCopyWith<$Res>
    implements $IndicatorsCopyWith<$Res> {
  factory _$$IndicatorsImplCopyWith(
          _$IndicatorsImpl value, $Res Function(_$IndicatorsImpl) then) =
      __$$IndicatorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sma_10') double sma10,
      @JsonKey(name: 'sma_50') double sma50,
      @JsonKey(name: 'rsi_14') double rsi14,
      @JsonKey(name: 'current_price') double? currentPrice,
      @JsonKey(name: 'price_change_1m') double? priceChange1m});
}

/// @nodoc
class __$$IndicatorsImplCopyWithImpl<$Res>
    extends _$IndicatorsCopyWithImpl<$Res, _$IndicatorsImpl>
    implements _$$IndicatorsImplCopyWith<$Res> {
  __$$IndicatorsImplCopyWithImpl(
      _$IndicatorsImpl _value, $Res Function(_$IndicatorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Indicators
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sma10 = null,
    Object? sma50 = null,
    Object? rsi14 = null,
    Object? currentPrice = freezed,
    Object? priceChange1m = freezed,
  }) {
    return _then(_$IndicatorsImpl(
      sma10: null == sma10
          ? _value.sma10
          : sma10 // ignore: cast_nullable_to_non_nullable
              as double,
      sma50: null == sma50
          ? _value.sma50
          : sma50 // ignore: cast_nullable_to_non_nullable
              as double,
      rsi14: null == rsi14
          ? _value.rsi14
          : rsi14 // ignore: cast_nullable_to_non_nullable
              as double,
      currentPrice: freezed == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange1m: freezed == priceChange1m
          ? _value.priceChange1m
          : priceChange1m // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndicatorsImpl implements _Indicators {
  const _$IndicatorsImpl(
      {@JsonKey(name: 'sma_10') required this.sma10,
      @JsonKey(name: 'sma_50') required this.sma50,
      @JsonKey(name: 'rsi_14') required this.rsi14,
      @JsonKey(name: 'current_price') this.currentPrice,
      @JsonKey(name: 'price_change_1m') this.priceChange1m});

  factory _$IndicatorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndicatorsImplFromJson(json);

  @override
  @JsonKey(name: 'sma_10')
  final double sma10;
  @override
  @JsonKey(name: 'sma_50')
  final double sma50;
  @override
  @JsonKey(name: 'rsi_14')
  final double rsi14;
  @override
  @JsonKey(name: 'current_price')
  final double? currentPrice;
  @override
  @JsonKey(name: 'price_change_1m')
  final double? priceChange1m;

  @override
  String toString() {
    return 'Indicators(sma10: $sma10, sma50: $sma50, rsi14: $rsi14, currentPrice: $currentPrice, priceChange1m: $priceChange1m)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndicatorsImpl &&
            (identical(other.sma10, sma10) || other.sma10 == sma10) &&
            (identical(other.sma50, sma50) || other.sma50 == sma50) &&
            (identical(other.rsi14, rsi14) || other.rsi14 == rsi14) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.priceChange1m, priceChange1m) ||
                other.priceChange1m == priceChange1m));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sma10, sma50, rsi14, currentPrice, priceChange1m);

  /// Create a copy of Indicators
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IndicatorsImplCopyWith<_$IndicatorsImpl> get copyWith =>
      __$$IndicatorsImplCopyWithImpl<_$IndicatorsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndicatorsImplToJson(
      this,
    );
  }
}

abstract class _Indicators implements Indicators {
  const factory _Indicators(
          {@JsonKey(name: 'sma_10') required final double sma10,
          @JsonKey(name: 'sma_50') required final double sma50,
          @JsonKey(name: 'rsi_14') required final double rsi14,
          @JsonKey(name: 'current_price') final double? currentPrice,
          @JsonKey(name: 'price_change_1m') final double? priceChange1m}) =
      _$IndicatorsImpl;

  factory _Indicators.fromJson(Map<String, dynamic> json) =
      _$IndicatorsImpl.fromJson;

  @override
  @JsonKey(name: 'sma_10')
  double get sma10;
  @override
  @JsonKey(name: 'sma_50')
  double get sma50;
  @override
  @JsonKey(name: 'rsi_14')
  double get rsi14;
  @override
  @JsonKey(name: 'current_price')
  double? get currentPrice;
  @override
  @JsonKey(name: 'price_change_1m')
  double? get priceChange1m;

  /// Create a copy of Indicators
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IndicatorsImplCopyWith<_$IndicatorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
