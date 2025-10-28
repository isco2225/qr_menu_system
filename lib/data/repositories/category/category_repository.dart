import 'package:flutter/foundation.dart' hide Category;

import '../../../app/app.dart';
import '../../../domain/domain.dart';

abstract class CategoryRepository {
  ValueListenable<List<Category>> get categories;
  Future<Result<List<Category>>> fetchCategories();
  Future<Result<Category>> fetchCategoryById(int id);
  Future<Result<Category>> createCategory({
    required String imageUrl,
    required String name,
    required bool isActive,
  });
  Future<Result<String>> uploadCategoryImage({required Uint8List imageBytes});
  Future<Result<void>> deleteCategoryImage({required String imageUrl});
  //Future<Result<List<Category?>>> fetchActiveCategories();
}
