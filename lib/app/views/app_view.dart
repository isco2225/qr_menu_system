import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = appRouter;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter,
    );
  }
}
