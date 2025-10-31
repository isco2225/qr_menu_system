import 'package:logging/logging.dart';

import '../../../../../app/app.dart';
import '../../../../../data/data.dart';
import '../../../../../domain/domain.dart';

/// ViewModel for creating new admin users.
///
/// Manages the state and business logic for admin creation flow.
class CreateAdminViewModel {
  CreateAdminViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    // DEFINE COMMANDS
    createAdmin = Command1(
      _createAdmin,
      debugLabel: 'CreateAdminViewModel.createAdmin',
    );
  }

  // LOGGER
  final Logger _log = Logger('CreateAdminViewModel');

  // REPOSITORIES & USE CASES
  final AdminRepository _adminRepository;

  // data

  // COMMANDS
  late Command1<
    AdminUser,
    ({String email, String password, String name, AdminUserRole role})
  >
  createAdmin;

  // DISPOSE
  void dispose() {
    createAdmin.dispose();
    _log.fine('Disposed');
  }

  Future<Result<AdminUser>> _createAdmin(
    ({String email, String password, String name, AdminUserRole role}) params,
  ) async {
    _log.info('Creating admin: ${params.email} with role: ${params.role.name}');

    final Result<AdminUser> result = await _adminRepository.createAdmin(
      email: params.email,
      password: params.password,
      name: params.name,
      role: params.role,
    );
    if (result is Error<AdminUser>) {
      _log.warning('Failed to create admin: ${params.email}', result.error);
      return result;
    }
    _log.fine('Admin created successfully: ${params.email}');
    return result;
  }
}
