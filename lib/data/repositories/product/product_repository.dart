import 'package:flutter/foundation.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';

abstract class ProductRepository {
  ValueListenable<List<Product>> get products;
  Future<Result<List<Product>>> fetchProducts(int categoryId);
}
