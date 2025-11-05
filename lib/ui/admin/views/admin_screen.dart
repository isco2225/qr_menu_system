import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (index) {
          widget.navigationShell.goBranch(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
        ],
      ),
    );
  }
}
