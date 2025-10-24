import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/app.dart';
import '../../../data/data.dart';
import '../../ui.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  late final FetchAdminViewModel fetchAdminViewModel;
  late final SignOutViewModel signOutViewModel;

  @override
  void initState() {
    super.initState();
    fetchAdminViewModel = FetchAdminViewModel(
      adminRepository: context.read<AdminRepository>(),
    );
    fetchAdminViewModel.fetchCurrentAdmin.execute();
    signOutViewModel = SignOutViewModel(
      adminRepository: context.read<AdminRepository>(),
    );
    signOutViewModel.signOut.handleError(context);
    signOutViewModel.signOut.handleCompleted(
      context,
      onCompleted: (result) {
        SignInRoute().go(context);
      },
    );
  }

  @override
  void dispose() {
    fetchAdminViewModel.dispose();
    signOutViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdminPanelView(
      fetchAdminViewModel: fetchAdminViewModel,
      signOutViewModel: signOutViewModel,
    );
  }
}
