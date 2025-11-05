import 'package:flutter/foundation.dart' hide Category;

import '../../../app/app.dart';
import '../../../domain/domain.dart';

abstract class CategoryRepository {
  ValueListenable<List<Category>> get categories;
  Future<Result<List<Category>>> fetchCategories({required AdminUser? admin});
  Future<Result<Category>> fetchCategoryById(int id);

  Future<Result<String>> uploadCategoryImage({required Uint8List imageBytes});
  Future<Result<void>> deleteCategoryImage({required String imageUrl});

  // Admin Features:
  Future<Result<Category>> createCategory({
    required String imageUrl,
    required String name,
    required bool isActive,
    // required createdAt,
    required AdminUser admin,
  });
}
