import 'package:qr_menu_system/domain/domain.dart';

/// Mock categories service for testing
class CategoriesService {
  /// Returns mock categories data
  List<Category> fetchMockCategories() {
    return const [
      Category(
        id: 1,
        name: 'Chicken',
        imageUrl: 'assets/categories/fride_chicken.jpeg',
        isActive: true,
      ),
      Category(
        id: 2,
        name: 'Shawarma',
        imageUrl: 'assets/categories/shawarma.jpg',
        isActive: true,
      ),
      Category(
        id: 3,
        name: 'Salads',
        imageUrl: 'assets/categories/salads.jpg',
        isActive: true,
      ),
      Category(
        id: 4,
        name: 'Pizza',
        imageUrl: 'assets/categories/pizza.jpg',
        isActive: true,
      ),
      Category(
        id: 5,
        name: 'Pasta',
        imageUrl: 'assets/categories/pasta.jpg',
        isActive: true,
      ),

      Category(
        id: 7,
        name: 'barbecue',
        imageUrl: 'assets/categories/barbecue.jpg',
        isActive: true,
      ),
      Category(
        id: 8,
        name: 'Drinks',
        imageUrl: 'assets/categories/drinks.jpg',
        isActive: true,
      ),
      Category(
        id: 12,
        name: 'Sandwiches',
        imageUrl: 'assets/products/fahitta.jpeg',
        isActive: true,
      ),
    ];
  }
}
