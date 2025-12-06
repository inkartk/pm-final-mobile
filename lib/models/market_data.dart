import 'package:freezed_annotation/freezed_annotation.dart';
import 'indicators.dart';

part 'market_data.freezed.dart';
part 'market_data.g.dart';

@freezed
class MarketData with _$MarketData {
  const factory MarketData({
    required String symbol,
    required double price,
    required Indicators indicators,
    required String source,
  }) = _MarketData;

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);
}
