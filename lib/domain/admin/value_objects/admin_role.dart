import 'package:formz/formz.dart';

import 'package:qr_menu_system/domain/admin/enums/enums.dart';

import '../../../app/app.dart';

/// Validates an admin role provided as a string name of [AdminUserRole].
class AdminRole extends FormzInput<String, RoleValueObjectFailure> {
  /// Creates a pure AdminRole with empty value
  const AdminRole.pure() : super.pure('');

  /// Creates a dirty AdminRole with [value]
  const AdminRole.dirty(super.value) : super.dirty();

  @override
  RoleValueObjectFailure? validator(final String value) {
    if (value.isEmpty) {
      return RoleEmpty();
    }
    final bool isKnown = AdminUserRole.values.any(
      (AdminUserRole role) => role.name == value,
    );
    if (!isKnown) {
      return RoleInvalid();
    }
    return null;
  }
}

sealed class RoleValueObjectFailure implements ValueObjectFailure {}

class RoleEmpty extends RoleValueObjectFailure {}

class RoleInvalid extends RoleValueObjectFailure {}
