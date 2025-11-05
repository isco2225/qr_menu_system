import 'dart:typed_data';

import 'package:flutter/foundation.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

/// Simple categories repository using Result pattern
class ProductRepositoryRemote extends ProductRepository {
  ProductRepositoryRemote({required ProductsService productsService})
    : _productsService = productsService;

  final ProductsService _productsService;

  @override
  ValueListenable<int> get productsCount => _productsCount;
  final ValueNotifier<int> _productsCount = ValueNotifier(0);

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

  @override
  Future<Result<String>> uploadProductImage({
    required Uint8List imageBytes,
    required String productId,
  }) async {
    // it will use _storageService.uploadImage to upload the image to the storage
    return Result.error(Exception('Not implemented'));
  }

  @override
  Future<Result<void>> deleteProductImage({required String imageUrl}) async {
    // it will use _storageService.deleteImage to delete the image from the storage
    return Result.error(Exception('Not implemented'));
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

  @override
  Future<Result<int>> getProductCount() async {
    try {
      final result = await _productsService.getProductsCount();
      _productsCount.value = result.asOk.value;
      return result;
    } catch (e) {
      return Result.error(Exception('Unknown error.'));
    }
  }
}
