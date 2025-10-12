import 'package:flutter/material.dart';

class AppSplashView extends StatefulWidget {
  const AppSplashView({super.key});

  @override
  State<AppSplashView> createState() => _AppSplashViewState();
}

class _AppSplashViewState extends State<AppSplashView> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
