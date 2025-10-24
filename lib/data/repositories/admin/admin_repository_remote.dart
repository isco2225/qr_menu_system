import 'package:flutter/foundation.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../services/admin_service.dart';
import 'admin_repository.dart';

/// Remote implementation of AdminRepository using Firebase services.
class AdminRepositoryRemote implements AdminRepository {
  AdminRepositoryRemote({required AdminService adminService})
    : _adminService = adminService;

  final AdminService _adminService;

  @override
  ValueListenable<AdminUser> get admin => _admin;
  final ValueNotifier<AdminUser> _admin = ValueNotifier(AdminUser());

  @override
  Future<Result<void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _adminService.signIn(
        email: email,
        password: password,
      );
      return result;
    } catch (e) {
      return Result.error(Exception('Failed to sign in: $e'));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      final result = await _adminService.signOut();
      return result;
    } catch (e) {
      return Result.error(Exception('Failed to sign out: $e'));
    }
  }

  @override
  Future<Result<AdminUser>> fetchCurrentAdmin() async {
    try {
      final result = await _adminService.fetchCurrentAdmin();
      switch (result) {
        case Ok():
          _admin.value = result.value;
          return result;
        case Error():
          return result;
      }
    } catch (e) {
      return Result.error(Exception('Failed to get current admin: $e'));
    }
  }

  @override
  Future<Result<AdminUser>> createAdmin({
    required String email,
    required String password,
    required String name,
    required AdminUserRole role,
  }) async {
    try {
      final result = await _adminService.createAdmin(
        email: email,
        password: password,
        name: name,
        role: role,
      );
      return result;
    } catch (e) {
      return Result.error(Exception('Failed to create admin: $e'));
    }
  }
}
