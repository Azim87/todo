import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/configs/router/router.dart';
import 'package:todo/core/utils/globals.dart';
import 'package:todo/data/repository/todo.dart';

part 'create_todo_cubit.freezed.dart';
part 'create_todo_state.dart';

@injectable
class CreateTodoCubit extends Cubit<CreateTodoState> {
  CreateTodoCubit(this.todoRepository) : super(const CreateTodoState());
  final TodoRepository todoRepository;

  void onTitleSave(String? title) => emit(state.copyWith(title: title));

  void onDescriptionSave(String? description) =>
      emit(state.copyWith(description: description));

  Future<void> onCreate() async {
    emit(state.copyWith(loading: true));
    final result = await todoRepository.addTodo(
        title: state.title!, description: state.description!);
    emit(state.copyWith(loading: false));

    if (result.isSuccess && (result.success?.success ?? false)) {
      navigatorKey.currentContext?.pop();
    }

    if (result.isError) showErrorDialog(result.error?.message ?? '');
  }
}
