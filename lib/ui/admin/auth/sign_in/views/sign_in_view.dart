import 'package:flutter/material.dart';
import 'package:qr_menu_system/ui/admin/auth/sign_in/widgets/widgets.dart';
import 'package:shared/shared.dart';

import '../../../../ui.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key, required this.signInViewModel});
  final SignInViewModel signInViewModel;

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final email = TextEditingController();
  final password = TextEditingController();
  final displayEmailError = ValueNotifier<bool>(false);
  final displayPasswordError = ValueNotifier<bool>(false);

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    displayEmailError.dispose();
    displayPasswordError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListenableBuilder(
              listenable: Listenable.merge([displayEmailError, email]),
              builder: (context, _) {
                return SignInEmailTextField(
                  displayError: displayEmailError,
                  email: email,
                );
              },
            ),
            ListenableBuilder(
              listenable: Listenable.merge([displayPasswordError, password]),
              builder: (context, _) {
                return SignInPasswordTextField(
                  displayError: displayPasswordError,
                  password: password,
                );
              },
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: widget.signInViewModel.signIn.running,
              builder: (context, isRunning, child) => isRunning
                  ? Center(child: CircularProgressIndicator())
                  : SignInButton(
                      email: email,
                      password: password,
                      viewModel: widget.signInViewModel,
                      displayEmailError: displayEmailError,
                      displayPasswordError: displayPasswordError,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
