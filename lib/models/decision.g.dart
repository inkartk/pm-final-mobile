// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DecisionImpl _$$DecisionImplFromJson(Map<String, dynamic> json) =>
    _$DecisionImpl(
      action: json['action'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      modelVersion: json['model_version'] as String?,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$$DecisionImplToJson(_$DecisionImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'confidence': instance.confidence,
      'model_version': instance.modelVersion,
      'reason': instance.reason,
    };
