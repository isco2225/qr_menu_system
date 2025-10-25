import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app/app.dart';
import '../../domain/domain.dart';

/// Service layer for admin operations using Firebase services.
class AdminService {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;
  Future<Result<AdminUser>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        return Result.error(Exception('Sign in failed: no user'));
      }

      final DocumentSnapshot doc = await _firestore
          .collection('admins')
          .doc(credential.user!.uid)
          .get();

      if (!doc.exists) {
        return Result.error(Exception('Admin not found'));
      }

      return Result.ok(AdminUser.fromJson(doc.data() as Map<String, dynamic>));
    } catch (e) {
      return Result.error(Exception('Failed to sign in: $e'));
    }
  }

  Future<Result<void>> signOut() async {
    try {
      await _auth.signOut();
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception('Failed to sign out: $e'));
    }
  }

  Future<Result<AdminUser>> fetchCurrentAdmin() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return Result.error(Exception('No admin logged in'));
      }
      final doc = await _firestore.collection('admins').doc(user.uid).get();
      if (!doc.exists) {
        return Result.error(Exception('Admin not found'));
      }

      return Result.ok(AdminUser.fromJson(doc.data()!));
    } catch (e) {
      return Result.error(Exception('Failed to get current admin: $e'));
    }
  }

  Future<Result<AdminUser>> createAdmin({
    required String email,
    required String password,
    required String name,
    required AdminUserRole role,
  }) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user == null) {
        return Result.error(Exception('Failed to create user'));
      }

      final AdminUser adminUser = AdminUser(
        uid: credential.user!.uid,
        email: email,
        name: name,
        role: role,
      );

      await _firestore
          .collection('admins')
          .doc(adminUser.uid)
          .set(adminUser.toJson());

      return Result.ok(adminUser);
    } catch (e) {
      return Result.error(Exception('Failed to create admin: $e'));
    }
  }
}
