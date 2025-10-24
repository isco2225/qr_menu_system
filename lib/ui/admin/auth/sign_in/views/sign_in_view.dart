import 'package:flutter/material.dart';
import 'package:shared/widgets/base/base_scaffold.dart';

import '../../../../ui.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key, required this.signInViewModel});
  final SignInViewModel signInViewModel;

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          TextField(controller: _emailController),
          TextField(controller: _passwordController),
          ElevatedButton(
            onPressed: () {
              widget.signInViewModel.signIn.execute((
                email: _emailController.text,
                password: _passwordController.text,
              ));
            },
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
