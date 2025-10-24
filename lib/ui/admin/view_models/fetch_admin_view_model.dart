import 'package:flutter/foundation.dart' hide Category;
import 'package:logging/logging.dart';

import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class FetchAdminViewModel {
  FetchAdminViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    // DEFINE COMMANDS
    fetchCurrentAdmin = Command0(
      _fetchCurrentAdmin,
      debugLabel: 'FetchAdminViewModel.fetchAdmin',
    );
  }
  // LOGGER
  final _log = Logger('FetchAdminViewModel');
  // REPOSITORIES & USE CASES
  final AdminRepository _adminRepository;

  // DOMAIN
  ValueListenable<AdminUser> get admin => _adminRepository.admin;

  // COMMANDS
  late Command0 fetchCurrentAdmin;

  // DISPOSE
  void dispose() {
    fetchCurrentAdmin.dispose();
    _log.fine('Disposed');
  }

  // FUNCTIONS
  Future<Result<void>> _fetchCurrentAdmin() async {
    try {
      await _adminRepository.fetchCurrentAdmin();
      return Result.ok(null);
    } catch (e) {
      _log.warning('Failed to load admin', e);
      return Result.error(Exception('Failed to load admin: $e'));
    }
  }
}
