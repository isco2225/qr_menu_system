import 'package:flutter/material.dart';
import 'package:shared/widgets/base/base_scaffold.dart';

import '../../ui.dart';

class AdminPanelView extends StatefulWidget {
  const AdminPanelView({
    super.key,
    required this.fetchAdminViewModel,
    required this.signOutViewModel,
  });
  final FetchAdminViewModel fetchAdminViewModel;
  final SignOutViewModel signOutViewModel;
  @override
  State<AdminPanelView> createState() => _AdminPanelViewState();
}

class _AdminPanelViewState extends State<AdminPanelView> {
  @override
  // void initState() {
  //   super.initState();
  //   widget.fetchAdminViewModel.fetchCurrentAdmin.execute();
  // }
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              widget.signOutViewModel.signOut.execute();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Admin Email: ${widget.fetchAdminViewModel.admin.value?.email ?? 'No admin found'}',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Admin Name: ${widget.fetchAdminViewModel.admin.value?.name ?? 'No admin found'}',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Admin Role: ${widget.fetchAdminViewModel.admin.value?.role ?? 'No admin found'}',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
