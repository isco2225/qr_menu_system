import 'package:flutter/foundation.dart' hide Category;
import 'package:logging/logging.dart';

import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class FetchCategoryAdminViewModel {
  FetchCategoryAdminViewModel({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository {
    // DEFINE COMMANDS
    fetchCategories = Command1(
      _fetchCategories,
      debugLabel: 'FetchCategoryAdminViewModel.fetchCategories',
    );
  }

  // LOGGER
  final _log = Logger('FetchCategoryAdminViewModel');

  // REPOSITORIES & USE CASES
  final CategoryRepository _categoryRepository;

  // DOMAIN
  /// All categories (including inactive) for admin users
  ValueListenable<List<Category>> get categories =>
      _categoryRepository.categories;

  // COMMANDS
  late Command1<void, ({AdminUser admin})> fetchCategories;

  // DISPOSE
  void dispose() {
    fetchCategories.dispose();
    _log.fine('Disposed');
  }

  // FUNCTIONS
  Future<Result<List<Category>>> _fetchCategories(
    ({AdminUser admin}) commands,
  ) async {
    final Result<List<Category>> result = await _categoryRepository
        .fetchCategories(admin: commands.admin);
    if (result is Error<List<Category>>) {
      _log.warning('Failed to load categories', result.error);
      return result;
    }
    _log.fine('Admin categories loaded');
    return result;
  }
}
