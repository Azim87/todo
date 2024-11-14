part of 'edit_todo_cubit.dart';

@freezed
class EditTodoState with _$EditTodoState {
  const factory EditTodoState({
    @Default(false) final bool loading,
    final String? title,
    final String? description,
  }) = _EditTodoState;
}
