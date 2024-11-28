import 'package:flutter/material.dart';
import 'package:todo/configs/router/router.dart';

Future<void> showErrorDialog(String data, {Function()? callback}) async =>
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Ошибка'),
        content: Text(data),
        actions: [
          TextButton(
            onPressed: () {
              callback?.call();
              Navigator.of(context).pop();
            },
            child: const Text('ОК'),
          ),
        ],
      ),
    );

Future<void> showSuccessDialog(String data, Function() callback) async =>
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Success'),
        content: Text(data),
        actions: [
          TextButton(
            onPressed: () {
              callback.call();
              Navigator.of(context).pop();
            },
            child: const Text('ОК'),
          ),
        ],
      ),
    );
