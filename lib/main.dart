import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/configs/di/di_container.dart';

import 'application/app.dart';
import 'configs/di/init_di.dart';

void main() {
  inject(getIt, Environment.dev);
  runApp(const MainApp());
}
