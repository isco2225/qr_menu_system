import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return AdminView(navigationShell: widget.navigationShell);
  }
}
