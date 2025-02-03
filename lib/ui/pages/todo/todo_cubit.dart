import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/config/router/router.dart';
import 'package:todo/core/utils/globals.dart';
import 'package:todo/data/model/todo/todo_response.dart';
import 'package:todo/data/repository/todo.dart';

part 'todo_cubit.freezed.dart';
part 'todo_state.dart';

@injectable
class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this.todoRepository) : super(const TodoState());

  final TodoRepository todoRepository;

  Future<List<TodoData>> allTodo(int page) async {
    final result = await todoRepository.allTodo(page, 10);
    if (result.isSuccess) {
      emit(state.copyWith(currentPage: page));
      return result.success?.data ?? [];
    }
    return [];
  }

  Future<void> deleteTodo(int? id) async {
    _showLoading();
    final result = await todoRepository.deleteTodo(id: id);
    _hideLoading();

    if (result.isSuccess) {
      if (result.success?.success ?? false) {
        navigatorKey.currentContext!.pop();
        emit(state.copyWith(currentPage: 0));
      }
    }
    if (result.isError) {
      showErrorDialog(result.error?.message ?? '');
    }
  }

  void _showLoading() => emit(state.copyWith(loading: true));

  void _hideLoading() => emit(state.copyWith(loading: false));
}
