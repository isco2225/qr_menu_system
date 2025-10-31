import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_exception.freezed.dart';

@freezed
sealed class AdminException with _$AdminException implements Exception {
  /// Unknown admin error
  const factory AdminException.unknown() = AdminUnknown;

  /// Authentication required for admin action
  const factory AdminException.authRequired() = AdminAuthRequired;

  /// Admin not found
  const factory AdminException.noAdminFound() = AdminNoAdminFound;

  /// Operation not permitted
  const factory AdminException.noPermission() = AdminNoPermission;

  /// Internal error
  const factory AdminException.internalError() = AdminInternalError;

  /// Admin is blocked
  const factory AdminException.blocked() = AdminBlocked;
}
