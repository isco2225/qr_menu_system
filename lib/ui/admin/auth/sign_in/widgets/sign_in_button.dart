import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../../../domain/domain.dart';
import '../../auth.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.email,
    required this.password,
    required this.viewModel,
    required this.displayEmailError,
    required this.displayPasswordError,
  });
  final TextEditingController email;
  final TextEditingController password;
  final SignInViewModel viewModel;
  final ValueNotifier<bool> displayEmailError;
  final ValueNotifier<bool> displayPasswordError;

  @override
  Widget build(BuildContext context) {
    return AppGradientButton(
      onPressed: () {
        if (!_isValueObjectsValid()) return;
        viewModel.signIn.execute((email: email.text, password: password.text));
      },
      text: 'Login',
      isLoading: viewModel.signIn.running.value,
    );
  }

  bool _isValueObjectsValid() {
    // Verify Email
    final isEmailValid = Email.dirty(email.text).isValid;
    if (!isEmailValid) displayEmailError.value = true;

    // Verify Password
    final isPasswordValid = Password.dirty(password.text).isValid;
    if (!isPasswordValid) displayPasswordError.value = true;

    return isEmailValid && isPasswordValid;
  }
}
