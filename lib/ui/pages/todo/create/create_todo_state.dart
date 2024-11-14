part of 'create_todo_cubit.dart';

@freezed
class CreateTodoState with _$CreateTodoState {
  const factory CreateTodoState({
    @Default(false) final bool loading,
    final String? title,
    final String? description,
  }) = _CreateTodoState;
}
