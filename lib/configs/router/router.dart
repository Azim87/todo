import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/configs/di/di_container.dart';
import 'package:todo/configs/router/r.dart';
import 'package:todo/data/data_source/local_data.dart';
import 'package:todo/ui/pages/authorization/login/login.dart';
import 'package:todo/ui/pages/todo/create/create_todo.dart';
import 'package:todo/ui/pages/todo/details/todo_details.dart';
import 'package:todo/ui/pages/todo/edit/edit_todo.dart';
import 'package:todo/ui/pages/todo/todo.dart';

import '../../data/model/todo/todo_response.dart';
import '../../ui/pages/authorization/signup/signup.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: R.root,
      builder: (context, state) => LoginPage(),
      redirect: (context, state) async {
        final localData = getIt<LocalData>();
        final accessToken = await localData.readAccessToken();
        if (accessToken != null) {
          return R.todo;
        }

        return null;
      },
    ),
    GoRoute(
      path: R.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: R.todo,
      builder: (context, state) => TodoPage(),
      routes: [
        GoRoute(
          path: R.detailsTodo,
          name: R.detailsTodo,
          builder: (context, state) => TodoDetails(todoData: state.extra as TodoData),
        ),
        GoRoute(
          path: R.createTodo,
          name: R.createTodo,
          builder: (context, state) => CreateTodo(),
        ),
        GoRoute(
          path: R.editTodo,
          name: R.editTodo,
          builder: (context, state) => EditTodo(data: state.extra as TodoData),
        ),
      ],
    ),
  ],
);
