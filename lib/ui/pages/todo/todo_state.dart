part of 'todo_cubit.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default(false) final bool loading,
    @Default(TodoResponse()) final TodoResponse todo,
    int? currentPage,
  }) = _TodoState;
}
