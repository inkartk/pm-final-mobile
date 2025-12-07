import 'package:freezed_annotation/freezed_annotation.dart';

part 'indicators.freezed.dart';
part 'indicators.g.dart';

@freezed
class Indicators with _$Indicators {
  const factory Indicators({
    @JsonKey(name: 'sma_10') required double sma10,
    @JsonKey(name: 'sma_50') required double sma50,
    @JsonKey(name: 'rsi_14') required double rsi14,
    @JsonKey(name: 'current_price') double? currentPrice,
    @JsonKey(name: 'price_change_1m') double? priceChange1m,
  }) = _Indicators;

  factory Indicators.fromJson(Map<String, dynamic> json) =>
      _$IndicatorsFromJson(json);
}
