import 'package:flutter/foundation.dart' hide Category;

import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

/// Simple categories repository using Result pattern
class CategoryRepositoryRemote extends CategoryRepository {
  CategoryRepositoryRemote({
    required CategoriesService categoriesService,
    required StorageService storageService,
  }) : _categoriesService = categoriesService,
       _storageService = storageService;

  final CategoriesService _categoriesService;
  final StorageService _storageService;

  /// Get all categories with Result pattern
  @override
  ValueListenable<List<Category>> get categories => _categories;
  final ValueNotifier<List<Category>> _categories = ValueNotifier([]);

  @override
  Future<Result<List<Category>>> fetchCategories({
    required AdminUser? admin,
  }) async {
    try {
      final Result<List<Category>> result = await _categoriesService
          .fetchCategories(admin: admin);
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
  Future<Result<Category>> createCategory({
    required String imageUrl,
    required String name,
    required bool isActive,
  }) async {
    try {
      final result = await _categoriesService.createCategory(
        category: Category(imageUrl: imageUrl, name: name, isActive: isActive),
      );
      switch (result) {
        case Ok():
          // Add to local cache
          _categories.value = [..._categories.value, result.value];
          return result;
        case Error():
          return result;
      }
    } catch (e) {
      return Result.error(Exception('Failed to create category: $e'));
    }
  }

  @override
  Future<Result<String>> uploadCategoryImage({
    required Uint8List imageBytes,
  }) async {
    try {
      print('Uploading category image');
      // Generate unique filename using timestamp and random component
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String random = DateTime.now().microsecondsSinceEpoch
          .toString()
          .substring(7);
      final String uniqueFilename = '${timestamp}_$random';
      print('Unique filename: $uniqueFilename');
      final Result<String> imageUrl = await _storageService.uploadImage(
        imageBytes: imageBytes,
        path: 'categories/$uniqueFilename.jpg',
      );
      print('Uploaded image URL: $imageUrl');
      return imageUrl;
    } catch (e) {
      print('Failed to upload category image: $e');
      return Result.error(Exception('Failed to upload category image: $e'));
    }
  }

  @override
  Future<Result<void>> deleteCategoryImage({required String imageUrl}) async {
    throw UnimplementedError();
  }
}
