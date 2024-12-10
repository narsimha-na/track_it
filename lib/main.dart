import 'package:flutter/material.dart';
import 'package:track_it/presentation/auth/splash_page.dart';

import 'core/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, router) {
        return Theme(
          data: ThemeData.light(),
          child: router!,
        );
      },
      routerConfig: goRouterPaths,
    );
  }
}
