import 'package:flutter/foundation.dart' hide Category;
import 'package:logging/logging.dart';

import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class FetchProductsViewModel {
  FetchProductsViewModel({required ProductRepository productRepository})
    : _productRepository = productRepository {
    // DEFINE COMMANDS
    fetchProducts = Command1(
      _fetchProducts,
      debugLabel: 'FetchProductsViewModel.fetchProducts',
    );
  }
  // LOGGER
  final _log = Logger('FetchCategoriesViewModel');
  // REPOSITORIES & USE CASES
  final ProductRepository _productRepository;

  // DOMAIN
  ValueListenable<List<Product>> get products => _products;
  final ValueNotifier<List<Product>> _products = ValueNotifier([]);

  // COMMANDS
  late Command1<void, ({int categoryId})> fetchProducts;

  // DISPOSE
  void dispose() {
    fetchProducts.dispose();
    _products.dispose();
    _log.fine('Disposed');
  }

  // FUNCTIONS
  Future<Result<List<Product>>> _fetchProducts(
    ({int categoryId}) commands,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await _productRepository.fetchProducts(
        commands.categoryId,
      );
      if (result is Error<List<Product>>) {
        _log.warning('Failed to load products', result.asError.error);
        return result;
      }
      _log.fine('Products loaded');
      _products.value = result.asOk.value;
      return result;
    } catch (e) {
      _log.warning('Failed to load products', e);
      return Result.error(Exception('Failed to load products: $e'));
    }
  }
}
