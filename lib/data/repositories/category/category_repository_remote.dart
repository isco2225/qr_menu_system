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
      final Result<List<Category>> result = await _categoriesService
          .fetchCategories();
      switch (result) {
        case Ok():
          _categories.value = result.value;
          return result;
        case Error():
          return result;
      }
    } catch (e) {
      return Result.error(Exception('Failed to load categories: $e'));
    }
  }

  @override
  Future<Result<Category>> fetchCategoryById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Result<Category>> createCategory({required Category category}) async {
    try {
      final Result<Category> result = await _categoriesService.createCategory(
        category: category,
      );
      switch (result) {
        case Ok():
          _categories.value = [..._categories.value, result.value];
          return result;
        case Error():
          return result;
      }
    } catch (e) {
      return Result.error(Exception('Failed to create category: $e'));
    }
  }
}
