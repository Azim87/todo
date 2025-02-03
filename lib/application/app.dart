import 'package:flutter/material.dart';

import '../config/router/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(routerConfig: router);
}
