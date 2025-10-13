import 'package:flutter/material.dart';
import 'package:shared/widgets/base/base_scaffold.dart';

class AdminPanelView extends StatefulWidget {
  const AdminPanelView({super.key});

  @override
  State<AdminPanelView> createState() => _AdminPanelViewState();
}

class _AdminPanelViewState extends State<AdminPanelView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body: Text('Admin Panel'));
  }
}
