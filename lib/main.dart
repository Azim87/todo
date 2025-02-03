import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/config/di/di_container.dart';
import 'package:todo/service/notificaiton_service.dart';

import 'application/app.dart';
import 'config/di/init_di.dart';

void main() => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();
        await NotificationService().init();
        inject(getIt, Environment.dev);
        runApp(const MainApp());
      },
      (err, stackTrace) {},
    );
