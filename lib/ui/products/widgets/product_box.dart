import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../ui.dart';

/// A modern product card widget displaying product image, name and description.
class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.product,
    required this.fetchProductsViewModel,
  });

  final Product product;
  final FetchProductsViewModel fetchProductsViewModel;

  static const double _cardHeight = 280.0;
  static const double _cardWidth = 200.0;
  static const double _imageHeight = 160.0;
  static const double _borderRadius = 20.0;
  static const double _cardPadding = 8.0;
  static const double _contentPadding = 9;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// show product detail pop up
        showDialog(
          context: context,
          builder: (context) => ProductDetail(product: product),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(_cardPadding),
        child: Container(
          height: _cardHeight,
          width: _cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(_borderRadius),
                ),
                child: Container(
                  height: _imageHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.grey.shade200, Colors.grey.shade100],
                    ),
                  ),
                  child: Image.asset(
                    product.imageUrls.first,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (
                          BuildContext context,
                          Object error,
                          StackTrace? stackTrace,
                        ) {
                          return Center(
                            child: Icon(
                              Icons.restaurant_menu,
                              size: 48,
                              color: Colors.grey.shade400,
                            ),
                          );
                        },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(_contentPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.description,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
