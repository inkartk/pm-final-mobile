import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade.freezed.dart';
part 'trade.g.dart';

@freezed
class Trade with _$Trade {
  const factory Trade({
    required int id,
    required String symbol,
    required String action,
    required double price,
    @JsonKey(name: 'execution_price') required double executionPrice,
    required DateTime timestamp,
    required String status,
    @JsonKey(name: 'order_id') required String orderId,
  }) = _Trade;

  factory Trade.fromJson(Map<String, dynamic> json) =>
      _$TradeFromJson(json);
}
