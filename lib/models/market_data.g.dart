// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketDataImpl _$$MarketDataImplFromJson(Map<String, dynamic> json) =>
    _$MarketDataImpl(
      symbol: json['symbol'] as String,
      price: (json['price'] as num).toDouble(),
      indicators:
          Indicators.fromJson(json['indicators'] as Map<String, dynamic>),
      source: json['source'] as String,
    );

Map<String, dynamic> _$$MarketDataImplToJson(_$MarketDataImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'price': instance.price,
      'indicators': instance.indicators,
      'source': instance.source,
    };
