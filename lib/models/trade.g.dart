// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TradeImpl _$$TradeImplFromJson(Map<String, dynamic> json) => _$TradeImpl(
      id: (json['id'] as num).toInt(),
      symbol: json['symbol'] as String,
      action: json['action'] as String,
      price: (json['price'] as num).toDouble(),
      executionPrice: (json['execution_price'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: json['status'] as String,
      orderId: json['order_id'] as String,
    );

Map<String, dynamic> _$$TradeImplToJson(_$TradeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'action': instance.action,
      'price': instance.price,
      'execution_price': instance.executionPrice,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': instance.status,
      'order_id': instance.orderId,
    };
