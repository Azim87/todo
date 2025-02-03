import 'package:flutter/material.dart';
import 'package:todo/config/router/r.dart';
import 'package:todo/config/router/router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FilledButton.tonal(
          onPressed: () {},
          child: const Text('Login with social network'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () => router.pushNamed(R.login),
                  child: const Text('Войти'),
                ),
                FilledButton(
                  onPressed: () => router.pushNamed(R.signUp),
                  child: const Text('Регистрация'),
                ),
              ],
            ),
          ),
        ),
      );
}
