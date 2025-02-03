import 'package:flutter/material.dart';
import 'package:todo/config/router/r.dart';
import 'package:todo/config/router/router.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnboardPage'),
      ),
      floatingActionButton: FilledButton(
        onPressed: () {
          router.go(R.auth);
        },
        child: const Text('NEXT'),
      ),
    );
  }
}
