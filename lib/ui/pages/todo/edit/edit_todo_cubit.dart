import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/configs/di/di_container.dart';
import 'package:todo/configs/router/router.dart';
import 'package:todo/data/model/todo/todo_response.dart';
import 'package:todo/data/repository/todo.dart';
import 'package:todo/ui/pages/todo/todo_cubit.dart';

part 'edit_todo_cubit.freezed.dart';
part 'edit_todo_state.dart';

@injectable
class EditTodoCubit extends Cubit<EditTodoState> {
  EditTodoCubit(this.todoRepository) : super(const EditTodoState());
  final TodoRepository todoRepository;

  void onEditTitle(String? title) => emit(state.copyWith(title: title));

  void onEditDescription(String? description) => emit(state.copyWith(description: description));

  Future<void> onEdit(int id) async {
    emit(state.copyWith(loading: true));
    final result = await todoRepository.editTodo(
      todo: TodoData(title: state.title, description: state.description),
      id: id,
    );
    emit(state.copyWith(loading: false));

    if (result.isSuccess) {
      if (result.success?.success ?? false) {
        navigatorKey.currentContext!.pop();
        getIt<TodoCubit>().allTodo();
      }
    }
    if (result.isError) {}
  }
}
