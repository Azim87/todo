import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/di/di_container.dart';
import 'package:todo/config/router/r.dart';
import 'package:todo/data/data_source/local_data.dart';
import 'package:todo/data/model/todo/todo_response.dart';
import 'package:todo/ui/components/custom_pagination_view.dart';
import 'package:todo/ui/pages/todo/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  final _cubit = getIt<TodoCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Sticky Headers'),
          actions: [
            IconButton(
              onPressed: () {
                getIt<LocalData>().clearCache();
                context.go(R.login);
              },
              icon: const Icon(Icons.exit_to_app_rounded),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.pushNamed(R.createTodo),
          label: const Text('Create'),
        ),
        body: BlocBuilder<TodoCubit, TodoState>(
          bloc: _cubit,
          builder: (context, state) => SafeArea(
            child: Column(
              children: [
                CustomPaginationView<TodoData>(
                  futureFactory: _cubit.allTodo,
                  currentPageKey: state.currentPage,
                  itemBuilder: (ctx, item, index) => ListTile(
                    trailing: item.completed ?? false
                        ? const Icon(
                            Icons.radio_button_checked_rounded,
                            color: Colors.red,
                          )
                        : const Icon(Icons.radio_button_unchecked),
                    onTap: () => context.pushNamed(
                      R.detailsTodo,
                      extra: item,
                    ),
                    title: Text('Title ${item.title}'),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Description ${item.description}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _showCupertinoModal(context, item),
                          icon: const Icon(Icons.more_vert_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future<String?> _showCupertinoModal(BuildContext context, TodoData data) => showCupertinoModalPopup<String>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text('Select an option'),
          message: const Text('Choose one of the options below'),
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Edit'),
              onPressed: () {
                context.pushNamed(R.editTodo, extra: data);
                context.pop();
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Delete'),
              onPressed: () => _cubit.deleteTodo(data.id),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () => context.pop(),
          ),
        ),
      );
}
