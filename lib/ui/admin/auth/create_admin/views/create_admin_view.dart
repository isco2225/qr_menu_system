import 'package:flutter/material.dart';
import 'package:shared/widgets/base/base_scaffold.dart';

import '../../../../../domain/domain.dart';
import '../../../../ui.dart';

class CreateAdminView extends StatefulWidget {
  const CreateAdminView({super.key, required this.createAdminViewModel});
  final CreateAdminViewModel createAdminViewModel;

  @override
  State<CreateAdminView> createState() => _CreateAdminViewState();
}

class _CreateAdminViewState extends State<CreateAdminView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  AdminUserRole _selectedRole = AdminUserRole.admin;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
            obscureText: true,
          ),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          DropdownButtonFormField<AdminUserRole>(
            initialValue: _selectedRole,
            items: AdminUserRole.values
                .map(
                  (e) => DropdownMenuItem<AdminUserRole>(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: (AdminUserRole? value) {
              if (value != null) {
                setState(() {
                  _selectedRole = value;
                });
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_emailController.text.isEmpty ||
                  _passwordController.text.isEmpty ||
                  _nameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Please fill all fields',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.errorContainer,
                  ),
                );
                return;
              }
              widget.createAdminViewModel.createAdmin.execute((
                email: _emailController.text,
                password: _passwordController.text,
                name: _nameController.text,
                role: _selectedRole,
              ));
            },
            child: const Text('Create Admin'),
          ),
        ],
      ),
    );
  }
}
