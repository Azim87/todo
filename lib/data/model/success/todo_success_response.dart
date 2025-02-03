import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_success_response.freezed.dart';

part 'todo_success_response.g.dart';

@freezed
class TodoSuccessResponse with _$TodoSuccessResponse {
  const factory TodoSuccessResponse({
    final String? message,
    final bool? success,
  }) = _TodoSuccessResponse;

  factory TodoSuccessResponse.fromJson(Map<String, dynamic> json) => _$TodoSuccessResponseFromJson(json);
}
