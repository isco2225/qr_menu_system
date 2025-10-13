import '../../../app/app.dart';
import '../../../domain/domain.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> fetchProductsByCategoryId(String categoryId);
}
