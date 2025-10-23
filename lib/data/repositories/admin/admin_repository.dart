import '../../../app/app.dart';
import '../../../domain/domain.dart';

abstract class AdminRepository {
  /// Signs in an admin with email and password.
  Future<Result<void>> signIn({
    required String email,
    required String password,
  });

  /// Signs out the current admin.
  Future<Result<void>> signOut();

  /// Gets the currently authenticated admin.
  Future<Result<AdminUser>> getCurrentAdmin();

  Future<Result<AdminUser>> createAdmin({
    required String email,
    required String password,
    required String name,
    required AdminUserRole role,
  });
}
