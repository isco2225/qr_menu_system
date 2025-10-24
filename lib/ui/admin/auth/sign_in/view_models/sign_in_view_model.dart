import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../../../../app/app.dart';
import '../../../../../data/data.dart';

class SignInViewModel extends ChangeNotifier {
  SignInViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    // DEFINE COMMANDS
    signIn = Command1(_signIn, debugLabel: 'signIn');

    // DEFINE LISTENERS
  }
  // LOGGER
  static final _log = Logger('SignInViewModel');

  // REPOSITORIES & USE CASES
  final AdminRepository _adminRepository;

  // DOMAIN

  // COMMANDS
  late Command1<void, ({String email, String password})> signIn;

  // DISPOSE
  @override
  void dispose() {
    signIn.dispose();
    super.dispose();
  }

  // FUNCTIONS

  Future<Result<void>> _signIn(({String email, String password}) params) async {
    final result = await _adminRepository.signIn(
      email: params.email,
      password: params.password,
    );
    return result;
  }
}
