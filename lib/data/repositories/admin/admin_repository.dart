import 'package:flutter/foundation.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';

abstract class AdminRepository {
  ValueListenable<AdminUser> get admin;
  Future<Result<void>> signIn({
    required String email,
    required String password,
  });

  Future<Result<void>> signOut();
  Future<Result<AdminUser>> fetchCurrentAdmin();

  Future<Result<AdminUser>> createAdmin({
    required String email,
    required String password,
    required String name,
    required AdminUserRole role,
  });
}
