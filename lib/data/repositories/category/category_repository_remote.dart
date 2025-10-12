import 'package:flutter/foundation.dart' hide Category;

import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

/// Simple categories repository using Result pattern
class CategoryRepositoryRemote extends CategoryRepository {
  CategoryRepositoryRemote({required CategoriesService categoriesService})
    : _categoriesService = categoriesService;

  final CategoriesService _categoriesService;

  /// Get all categories with Result pattern
  @override
  ValueListenable<List<Category>> get categories => _categories;
  final ValueNotifier<List<Category>> _categories = ValueNotifier([]);

  @override
  Future<Result<List<Category>>> fetchCategories() async {
    try {
      final categories = _categoriesService.fetchMockCategories();
      switch (Result.ok(categories)) {
        case Ok():
          _categories.value = categories;
          return Result.ok(categories);
        case Error():
          return Result.error(Exception('Failed to load categories'));
      }
    } catch (e) {
      return Result.error(Exception('Failed to load categories: $e'));
    }
  }

  @override
  Future<Result<List<Category?>>> fetchActiveCategories() async {
    try {
      final categories = _categoriesService.fetchMockCategories();
      final activeCategories = categories
          .where((category) => category.isActive)
          .toList();
      if (activeCategories.isEmpty) {
        return Result.error(Exception('No active categories found'));
      }
      return Result.ok(activeCategories);
    } catch (e) {
      return Result.error(Exception('Failed to load active categories: $e'));
    }
  }

  @override
  Future<Result<Category>> fetchCategoryById(int id) {
    throw UnimplementedError();
  }
}
