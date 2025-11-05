import 'package:flutter/foundation.dart' hide Category;
import 'package:logging/logging.dart';

import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class FetchCategoriesViewModel {
  FetchCategoriesViewModel({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository {
    // DEFINE COMMANDS
    fetchCategories = Command1(
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
  late Command1<void, ({AdminUser? admin})> fetchCategories;

  // DISPOSE
  void dispose() {
    fetchCategories.dispose();
    _log.fine('Disposed');
  }

  // FUNCTIONS
  Future<Result<List<Category>>> _fetchCategories(
    ({AdminUser? admin}) commands,
  ) async {
    print(commands.admin?.email);
    final result = await _categoryRepository.fetchCategories(
      admin: commands.admin,
    );
    if (result is Error<List<Category>>) {
      _log.warning('Failed to load categories', result.error);
      return result;
    }
    if (result is Error<List<Category>>) {
      _log.warning('Could not fetching');
    }
    _log.fine('Categories loaded');
    return result;
  }
}
