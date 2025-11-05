import 'package:qr_menu_system/domain/domain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app/app.dart';

class CategoriesService {
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;
  FirebaseAuth get _auth => FirebaseAuth.instance;
  Future<Result<List<Category>>> fetchCategories({
    required AdminUser? admin,
  }) async {
    try {
      print('Fetching categories');
      final categories = admin == null
          ? await _firestore
                .collection('categories')
                .where('isActive', isEqualTo: true)
                .get()
          : await _firestore.collection('categories').get();
      if (categories.docs.isEmpty) {
        print('No categories found');
        return Result.error(Exception('No categories found'));
      }
      print('Categories loaded: ${categories.docs.map((doc) => doc.data())}');
      return Result.ok(
        categories.docs.map((doc) => Category.fromJson(doc.data())).toList(),
      );
    } catch (e) {
      print('Failed to load categories: $e');
      return Result.error(Exception('Failed to load categories: $e'));
    }
  }

  // TODO: it will required "created by(adminName)".
  Future<Result<Category>> createCategory({required Category category}) async {
    try {
      // Check admin authentication
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        return Result.error(Exception('Admin authentication required'));
      }

      // Verify user is superAdmin
      final DocumentSnapshot adminDoc = await _firestore
          .collection('admins')
          .doc(currentUser.uid)
          .get();
      if (!adminDoc.exists) {
        return Result.error(Exception('Admin not found'));
      }

      final Map<String, dynamic> adminData =
          adminDoc.data() as Map<String, dynamic>;
      final String role = adminData['role'] as String? ?? '';
      if (role != 'superAdmin') {
        return Result.error(Exception('Only superAdmin can create categories'));
      }

      final DocumentReference docRef = await _firestore
          .collection('categories')
          .add(category.toJson());
      if (docRef.id.isEmpty) {
        return Result.error(Exception('Failed to create category'));
      }
      final createdCategory = category.copyWith(id: docRef.id);
      return Result.ok(createdCategory);
    } catch (e) {
      return Result.error(Exception('Failed to create category: $e'));
    }
  }
}
