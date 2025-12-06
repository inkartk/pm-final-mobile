// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExecutionImpl _$$ExecutionImplFromJson(Map<String, dynamic> json) =>
    _$ExecutionImpl(
      executed: json['executed'] as bool,
      executionPrice: (json['execution_price'] as num).toDouble(),
      orderId: json['order_id'] as String,
      status: json['status'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$ExecutionImplToJson(_$ExecutionImpl instance) =>
    <String, dynamic>{
      'executed': instance.executed,
      'execution_price': instance.executionPrice,
      'order_id': instance.orderId,
      'status': instance.status,
      'time': instance.time.toIso8601String(),
    };
