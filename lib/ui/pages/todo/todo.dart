import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/configs/di/di_container.dart';
import 'package:todo/data/data_source/local_data.dart';
import 'package:todo/data/model/todo/todo_response.dart';
import 'package:todo/ui/pages/todo/todo_cubit.dart';

import '../../../configs/router/r.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  final _cubit = getIt<TodoCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.pushNamed(R.createTodo),
          label: const Text('Create'),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                forceMaterialTransparency: true,
                floating: true,
                title: const Text('Sticky Headers'),
                actions: [
                  IconButton(
                    onPressed: () => getIt<LocalData>().clearCache().whenComplete(() => context.go(R.root)),
                    icon: const Icon(Icons.exit_to_app_rounded),
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => BlocBuilder<TodoCubit, TodoState>(
                    bloc: _cubit,
                    builder: (context, state) {
                      if (state.loading) {
                        return const Center(child: CircularProgressIndicator.adaptive());
                      }
                      return Column(
                        children: [
                          Container(
                            height: 40,
                            color: Colors.grey,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Todo ${state.todo.data?.length} items',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          if (state.todo.data != null)
                            ListView.builder(
                              reverse: true,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.todo.data?.length,
                              itemBuilder: (context, int index) => ListTile(
                                trailing: state.todo.data?[index].completed ?? false
                                    ? const Icon(
                                        Icons.radio_button_checked_rounded,
                                        color: Colors.red,
                                      )
                                    : const Icon(Icons.radio_button_unchecked),
                                onTap: () => context.pushNamed(
                                  R.detailsTodo,
                                  extra: state.todo.data?[index],
                                ),
                                title: Text('Title ${state.todo.data?[index].title}'),
                                subtitle: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Description ${state.todo.data?[index].description}',
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    IconButton(
                                      onPressed: () => _showCupertinoModal(context, state.todo.data![index]),
                                      icon: const Icon(Icons.more_vert_rounded),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          else
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset('assets/anim/empty_anim.json'),
                            )
                        ],
                      );
                    },
                  ),
                  childCount: 1,
                ),
              ),
            ],
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
              onPressed: () => _cubit.deleteTodo(data.id).whenComplete(() => context.pop()),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () => context.pop(),
          ),
        ),
      );
}
