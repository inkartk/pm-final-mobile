import 'package:freezed_annotation/freezed_annotation.dart';

part 'execution.freezed.dart';
part 'execution.g.dart';

@freezed
class Execution with _$Execution {
  const factory Execution({
    required bool executed,
    @JsonKey(name: 'execution_price') required double executionPrice,
    @JsonKey(name: 'order_id') required String orderId,
    required String status,
    required DateTime time,
  }) = _Execution;

  factory Execution.fromJson(Map<String, dynamic> json) =>
      _$ExecutionFromJson(json);
}
