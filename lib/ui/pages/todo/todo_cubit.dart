import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/utils/globals.dart';
import 'package:todo/data/model/todo/todo_response.dart';
import 'package:todo/data/repository/todo.dart';

part 'todo_cubit.freezed.dart';
part 'todo_state.dart';

@lazySingleton
class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this.todoRepository) : super(const TodoState()) {
    allTodo();
  }

  final TodoRepository todoRepository;

  Future<void> allTodo() async {
    _showLoading();
    final result = await todoRepository.allTodo();
    _hideLoading();

    if (result.isSuccess) {
      if (result.success?.success ?? false) {
        emit(state.copyWith(todo: result.success ?? const TodoResponse()));
      }
    }
    if (result.isError) showErrorDialog(result.error?.message ?? '');
  }

  Future<void> deleteTodo(int? id) async {
    _showLoading();
    final result = await todoRepository.deleteTodo(id: id);
    _hideLoading();

    if (result.isSuccess) {
      if (result.success?.success ?? false) {
        allTodo();
      }
    }
    if (result.isError) showErrorDialog(result.error?.message ?? '');
  }

  void _showLoading() => emit(state.copyWith(loading: true));

  void _hideLoading() => emit(state.copyWith(loading: false));
}
