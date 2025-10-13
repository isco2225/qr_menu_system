import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

/// Simple categories repository using Result pattern
class ProductRepositoryRemote extends ProductRepository {
  ProductRepositoryRemote({required ProductsService productsService})
    : _productsService = productsService;

  final ProductsService _productsService;

  /// Get all products by category id with Result pattern
  @override
  Future<Result<List<Product>>> fetchProductsByCategoryId(
    String categoryId,
  ) async {
    try {
      final products = await _productsService.fetchProductsByCategoryId(
        categoryId,
      );
      return products;
    } catch (e) {
      return Result.error(Exception('Failed to load products: $e'));
    }
  }

  //@override
  //Future<Result<List<Product>>> fetchProducts(int categoryId) async {
  //  try {
  //    final products = _productsService
  //        .fetchMockProducts()
  //        .where((product) => product.categoryId == categoryId)
  //        .toList();
  //    switch (Result.ok(products)) {
  //      case Ok():
  //        _products.value = products;
  //        return Result.ok(products);
  //      case Error():
  //        return Result.error(Exception('Failed to load products'));
  //    }
  //  } catch (e) {
  //    return Result.error(Exception('Failed to load products: $e'));
  //  }
  //}
}
