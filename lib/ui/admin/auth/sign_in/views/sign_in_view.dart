import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/widgets/base/base_scaffold.dart';
import 'package:shared/widgets/text_fields/app_text_field.dart';

import '../../../../ui.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key, required this.signInViewModel});
  final SignInViewModel signInViewModel;

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          AppTextField(
            'Email',
            showText: 'show',
            hideText: 'hide',
            textEditingController: _emailController,
          ),
          AppTextField(
            'Password',
            showText: 'show',
            hideText: 'hide',
            isPassword: true,
            textEditingController: _passwordController,
          ),
          AppButton(
            running: widget.signInViewModel.signIn.running,
            onPressed: () {
              widget.signInViewModel.signIn.execute((
                email: _emailController.text,
                password: _passwordController.text,
              ));
            },
            text: 'Sign In',
          ),
        ],
      ),
    );
  }
}
