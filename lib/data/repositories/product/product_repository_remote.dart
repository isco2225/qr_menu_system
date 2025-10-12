import 'package:flutter/foundation.dart' hide Category;

import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

/// Simple categories repository using Result pattern
class ProductRepositoryRemote extends ProductRepository {
  ProductRepositoryRemote({required ProductsService productsService})
    : _productsService = productsService;

  final ProductsService _productsService;

  /// Get all categories with Result pattern
  @override
  ValueListenable<List<Product>> get products => _products;
  final ValueNotifier<List<Product>> _products = ValueNotifier([]);

  @override
  Future<Result<List<Product>>> fetchProducts(int categoryId) async {
    try {
      final products = _productsService
          .fetchMockProducts()
          .where((product) => product.categoryId == categoryId)
          .toList();
      switch (Result.ok(products)) {
        case Ok():
          _products.value = products;
          return Result.ok(products);
        case Error():
          return Result.error(Exception('Failed to load products'));
      }
    } catch (e) {
      return Result.error(Exception('Failed to load products: $e'));
    }
  }
}
