import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_response.freezed.dart';
part 'todo_response.g.dart';

@freezed
class TodoResponse with _$TodoResponse {
  const factory TodoResponse({
    final List<TodoData>? data,
    final bool? success,
  }) = _TodoResponse;

  factory TodoResponse.fromJson(Map<String, dynamic> json) => _$TodoResponseFromJson(json);
}

@freezed
class TodoData with _$TodoData {
  const factory TodoData({
    final int? id,
    final String? title,
    final String? description,
    final bool? completed,
  }) = _TodoData;

  factory TodoData.fromJson(Map<String, dynamic> json) => _$TodoDataFromJson(json);
}
