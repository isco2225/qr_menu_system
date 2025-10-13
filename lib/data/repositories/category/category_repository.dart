import 'package:flutter/foundation.dart' hide Category;

import '../../../app/app.dart';
import '../../../domain/domain.dart';

abstract class CategoryRepository {
  ValueListenable<List<Category>> get categories;
  Future<Result<List<Category>>> fetchCategories();
  Future<Result<Category>> fetchCategoryById(int id);
  //Future<Result<List<Category?>>> fetchActiveCategories();
}
