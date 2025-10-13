import 'package:flutter/foundation.dart' hide Category;
import 'package:logging/logging.dart';

import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class FetchCategoriesViewModel {
  FetchCategoriesViewModel({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository {
    // DEFINE COMMANDS
    fetchCategories = Command0(
      _fetchCategories,
      debugLabel: 'FetchCategoriesViewModel.fetchCategories',
    );
  }
  // LOGGER
  final _log = Logger('FetchCategoriesViewModel');
  // REPOSITORIES & USE CASES
  final CategoryRepository _categoryRepository;

  // DOMAIN
  ValueListenable<List<Category>> get categories =>
      _categoryRepository.categories;

  // COMMANDS
  late Command0 fetchCategories;

  // DISPOSE
  void dispose() {
    fetchCategories.dispose();
    _log.fine('Disposed');
  }

  // FUNCTIONS
  Future<Result<List<Category>>> _fetchCategories() async {
    try {
      final result = await _categoryRepository.fetchCategories();
      if (result is Error<List<Category>>) {
        _log.warning('Failed to load categories', result.error);
        return result;
      }
      _log.fine('Categories loaded');
      return result;
    } catch (e) {
      _log.warning('Failed to load categories', e);
      return Result.error(Exception('Failed to load categories: $e'));
    }
  }
}
