import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../../../domain/domain.dart';

class SignInPasswordTextField extends StatelessWidget {
  const SignInPasswordTextField({
    super.key,
    required TextEditingController password,
    required ValueNotifier<bool> displayError,
  }) : _password = password,
       _displayError = displayError;

  final ValueNotifier<bool> _displayError;
  final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    final passwordVO = Password.dirty(_password.text);

    return AppTextField(
      "password",
      errorText: passwordVO.isNotValid && _displayError.value
          ? 'Invalid Password'
          : null,
      textEditingController: _password,
      isPassword: true,
      showText: 'Show',
      hideText: 'Hide',
    );
  }
}
