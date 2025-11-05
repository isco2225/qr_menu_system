import 'package:flutter/foundation.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';

abstract class ProductRepository {
  ValueListenable<int> get productsCount;
  Future<Result<int>> getProductCount();
  Future<Result<List<Product>>> fetchProductsByCategoryId(String categoryId);
  Future<Result<String>> uploadProductImage({
    required Uint8List imageBytes,
    required String productId,
  });
  Future<Result<void>> deleteProductImage({required String imageUrl});
}
