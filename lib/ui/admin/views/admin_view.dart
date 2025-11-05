import 'package:flutter/material.dart';
import 'package:qr_menu_system/ui/ui.dart';
import 'package:shared/widgets/widgets.dart';

class AdminView extends StatefulWidget {
  const AdminView({
    super.key,
    required this.signOutViewModel,
    required this.fetchAdminViewModel,
  });
  final SignOutViewModel signOutViewModel;
  final FetchAdminViewModel fetchAdminViewModel;

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://ui-avatars.com/api/?name=${widget.fetchAdminViewModel.admin.value?.name ?? ''}',
          ),
        ),
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
        children: [
          /*
          TextButton(
            onPressed: () {
              const CategoryRoute().go(context);
            },
            child: const Text("Categories"),
          ),
          TextButton(
            onPressed: () {
              const CategoryRoute().go(context);
            },
            child: const Text("Admins"),
          ),
          TextButton(
            onPressed: () {
              const CategoryRoute().go(context);
            },
            child: const Text("Categories"),
          ),*/
        ],
      ),
    );
  }
}
