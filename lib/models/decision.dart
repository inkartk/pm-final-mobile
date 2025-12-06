import 'package:freezed_annotation/freezed_annotation.dart';

part 'decision.freezed.dart';
part 'decision.g.dart';

@freezed
class Decision with _$Decision {
  const factory Decision({
    required String action,
    required double confidence,
    @JsonKey(name: 'model_version') required String modelVersion,
    required String reason,
  }) = _Decision;

  factory Decision.fromJson(Map<String, dynamic> json) =>
      _$DecisionFromJson(json);
}
