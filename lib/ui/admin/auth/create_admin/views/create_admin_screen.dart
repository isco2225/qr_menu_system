import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/data.dart';
import '../create_admin.dart';

class CreateAdminScreen extends StatefulWidget {
  const CreateAdminScreen({super.key});

  @override
  State<CreateAdminScreen> createState() => _CreateAdminScreenState();
}

class _CreateAdminScreenState extends State<CreateAdminScreen> {
  late final CreateAdminViewModel createAdminViewModel;
  @override
  void initState() {
    super.initState();
    createAdminViewModel = CreateAdminViewModel(
      adminRepository: context.read<AdminRepository>(),
    );
    createAdminViewModel.createAdmin.handleCompleted(
      context,
      onCompleted: (admin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Admin created successfully'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
    createAdminViewModel.createAdmin.handleError(context);
  }

  @override
  void dispose() {
    createAdminViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CreateAdminView(createAdminViewModel: createAdminViewModel);
  }
}
