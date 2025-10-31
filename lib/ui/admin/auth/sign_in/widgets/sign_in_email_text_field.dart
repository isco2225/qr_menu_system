import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../../../domain/domain.dart';

class SignInEmailTextField extends StatelessWidget {
  const SignInEmailTextField({
    super.key,
    required TextEditingController email,
    required ValueNotifier<bool> displayError,
  }) : _email = email,
       _displayError = displayError;

  final ValueNotifier<bool> _displayError;
  final TextEditingController _email;

  @override
  Widget build(BuildContext context) {
    final emailVO = Email.dirty(_email.text);

    return AppTextField(
      "Email",
      errorText: emailVO.isNotValid && _displayError.value
          ? 'Invalid Email'
          : null,
      textEditingController: _email,
      showText: '',
      hideText: '',
    );
  }
}
