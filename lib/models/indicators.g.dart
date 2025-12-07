// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicators.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IndicatorsImpl _$$IndicatorsImplFromJson(Map<String, dynamic> json) =>
    _$IndicatorsImpl(
      sma10: (json['sma_10'] as num).toDouble(),
      sma50: (json['sma_50'] as num).toDouble(),
      rsi14: (json['rsi_14'] as num).toDouble(),
      currentPrice: (json['current_price'] as num?)?.toDouble(),
      priceChange1m: (json['price_change_1m'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$IndicatorsImplToJson(_$IndicatorsImpl instance) =>
    <String, dynamic>{
      'sma_10': instance.sma10,
      'sma_50': instance.sma50,
      'rsi_14': instance.rsi14,
      'current_price': instance.currentPrice,
      'price_change_1m': instance.priceChange1m,
    };
