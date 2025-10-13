import 'package:qr_menu_system/domain/domain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../app/app.dart';

class CategoriesService {
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;
  Future<Result<List<Category>>> fetchCategories() async {
    try {
      print('Fetching categories');
      final categories = await _firestore
          .collection('categories')
          .where('isActive', isEqualTo: true)
          .get();
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
}
