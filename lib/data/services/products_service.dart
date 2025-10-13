import 'package:cloud_firestore/cloud_firestore.dart';

import '../../app/app.dart';
import '../../domain/domain.dart';

class ProductsService {
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  Future<Result<List<Product>>> fetchProductsByCategoryId(
    String categoryId,
  ) async {
    try {
      print('Fetching products by category id: $categoryId');
      final result = await _firestore
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .where('isActive', isEqualTo: true)
          .get();
      //if (result.docs.isEmpty) {
      //  print('No products found');
      //  return Result.error(Exception('No products found'));
      //}
      final products = result.docs
          .map((doc) => Product.fromJson(doc.data()))
          .toList();
      return Result.ok(products);
    } catch (e) {
      return Result.error(Exception('Failed to load products: $e'));
    }
  }

  /*List<Product> fetchMockProducts() {
      return [
      Product(
        id: 1,
        categoryId: 1,
        name: 'Chicken',
        description:
            'Tender, juicy chicken prepared with the finest ingredients. Perfectly seasoned and cooked to perfection for a delicious meal every time. Our signature chicken dish features a crispy golden exterior and a succulent, flavorful interior, marinated in a blend of aromatic spices. Served hot and fresh, it pairs wonderfully with your favorite sides and sauces, making it an irresistible choice for lunch or dinner. Experience the taste of home-cooked comfort with every bite, crafted to satisfy your cravings and leave you wanting more.',
        imageUrls: ['assets/products/chicken.jpeg'],
        isActive: true,
        price: 10,
        discount: 0,
      ),
      Product(
        id: 2,
        categoryId: 1,
        name: 'Chicken bechamel',
        description: 'Chicken bechamel description',
        imageUrls: ['assets/products/chicken_bechamel.jpg'],
        isActive: true,
        price: 11,
        discount: 0,
      ),
      Product(
        id: 3,
        categoryId: 2,
        name: 'Shawarma',
        description:
            'Authentic Middle Eastern shawarma made with perfectly seasoned meat, slow-roasted on a vertical spit until tender and juicy. Wrapped in warm, fresh flatbread and garnished with crisp vegetables, tangy pickles, and our signature garlic sauce. Each bite delivers a harmonious blend of flavors and textures, from the aromatic spices to the creamy sauce. A street food favorite elevated to perfection, offering a satisfying and delicious meal that captures the essence of traditional shawarma craftsmanship.',
        imageUrls: ['assets/products/shawarma_one.jpeg'],
        isActive: true,
        price: 10,
        discount: 0,
      ),
      Product(
        id: 4,
        categoryId: 2,
        name: 'Shawarma araby',
        description:
            'Experience the authentic taste of Arabic-style shawarma, featuring thinly sliced meat marinated in traditional Middle Eastern spices and slow-roasted to perfection. Served in fresh Arabic bread with a generous portion of tahini sauce, fresh vegetables, and our special seasoning blend. This classic street food favorite brings together the rich flavors of the Middle East with a distinctive local twist. The combination of tender meat, crisp vegetables, and aromatic spices creates an unforgettable taste that transports you straight to the bustling streets of the Arab world.',
        imageUrls: ['assets/products/shawarma_arabi.jpeg'],
        isActive: true,
        price: 18,
        discount: 0,
      ),
      Product(
        id: 5,
        categoryId: 12,
        name: 'fahitta',
        description: 'the best fahitta in the world',
        imageUrls: ['assets/products/fahitta.jpeg'],
        isActive: true,
        price: 15,
        discount: 0,
      ),
      Product(
        id: 6,
        categoryId: 12,
        name: 'kresby',
        description: 'grilled chicken sandwich',
        imageUrls: ['assets/products/kresbi.jpeg'],
        isActive: true,
        price: 16,
        discount: 0,
      ),
      Product(
        id: 7,
        categoryId: 4,
        name: 'pizza with cheese',
        description:
            'Indulge in our classic cheese pizza, featuring a perfectly crispy crust topped with our signature tomato sauce and a generous blend of premium melted cheeses. Each slice offers the perfect balance of flavors, with stretchy mozzarella complemented by rich parmesan and our special cheese blend. The crust is hand-tossed and baked to golden perfection, creating a delightful combination of crispy exterior and soft, chewy interior. A timeless favorite that delivers pure comfort in every bite.',
        imageUrls: ['assets/products/sucuk_kasar.jpeg'],
        isActive: true,
        price: 22,
        discount: 0,
      ),
      Product(
        id: 8,
        categoryId: 4,
        name: 'Atom pizza',
        description:
            'Experience our signature Atom pizza, a flavor explosion that lives up to its name. This bold creation features a perfect blend of spicy pepperoni, hot Italian sausage, jalapeños, and crushed red pepper flakes, all layered over our house-made tomato sauce and melted mozzarella. The heat is perfectly balanced with sweet roasted bell peppers and caramelized onions. Our crispy, hand-tossed crust provides the perfect foundation for this fiery masterpiece. A must-try for spice enthusiasts looking for an unforgettable pizza experience.',
        imageUrls: ['assets/products/karisik_pizza.jpeg'],
        isActive: true,
        price: 29,
        discount: 0,
      ),
    ];
  }*/
}
