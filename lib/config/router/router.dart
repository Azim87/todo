import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/router/r.dart';
import 'package:todo/data/data_source/local_data.dart';
import 'package:todo/ui/pages/authorization/auth_page.dart';
import 'package:todo/ui/pages/authorization/login/login.dart';
import 'package:todo/ui/pages/get_start/get_started_page.dart';
import 'package:todo/ui/pages/main_page.dart';
import 'package:todo/ui/pages/onboard/onboard_page.dart';
import 'package:todo/ui/pages/search/search_page.dart';
import 'package:todo/ui/pages/todo/create/create_todo.dart';
import 'package:todo/ui/pages/todo/details/todo_details.dart';
import 'package:todo/ui/pages/todo/edit/edit_todo.dart';
import 'package:todo/ui/pages/todo/todo.dart';

import '../../data/model/todo/todo_response.dart';
import '../../ui/pages/authorization/signup/signup.dart';
import '../di/di_container.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: R.getStarted,
      builder: (context, state) => const GetStartedPage(),
    ),
    GoRoute(
      path: R.onboard,
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: R.root,
      builder: (context, state) => LoginPage(),
      redirect: (context, state) async {
        final localData = getIt<LocalData>();
        final accessToken = await localData.readAccessToken();
        bool? isOnboard;

        if (!(isOnboard ?? false)) {
          return R.getStarted;
        } else if (accessToken != null) {
          return R.todo;
        } else {
          return R.login;
        }
      },
    ),
    GoRoute(
      path: R.auth,
      builder: (context, state) => const AuthPage(),
      routes: [
        GoRoute(
          path: R.login,
          name: R.login,
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: R.signUp,
          name: R.signUp,
          builder: (context, state) => SignUpPage(),
        ),
      ],
    ),
    GoRoute(
      path: R.main,
      builder: (context, state) => const MainPage(),
      routes: [
        GoRoute(
          path: R.search,
          name: R.search,
          builder: (context, state) => const SearchPage(),
        )
      ],
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
    // GoRoute(
    //   path: R.root,
    //   builder: (context, state) => SplashPage(),
    // ),
  ],
);
