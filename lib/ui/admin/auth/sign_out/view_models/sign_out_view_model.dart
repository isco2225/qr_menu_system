import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../../../../app/app.dart';
import '../../../../../data/data.dart';

class SignOutViewModel extends ChangeNotifier {
  SignOutViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    // DEFINE COMMANDS
    signOut = Command0(_signOut, debugLabel: 'signOut');

    // DEFINE LISTENERS
  }
  // LOGGER
  static final _log = Logger('SignOutViewModel');

  // REPOSITORIES & USE CASES
  final AdminRepository _adminRepository;

  // DOMAIN

  // COMMANDS
  late Command0<void> signOut;

  // DISPOSE
  @override
  void dispose() {
    signOut.dispose();
    super.dispose();
  }

  // FUNCTIONS

  Future<Result<void>> _signOut() async {
    _log.info('signing out');
    final result = await _adminRepository.signOut();
    if (result is Error<void>) {
      _log.warning('failed to sign out.');
      return result;
    }
    return result;
  }
}
