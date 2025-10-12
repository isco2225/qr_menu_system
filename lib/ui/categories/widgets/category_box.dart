import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../ui.dart';

/// A beautifully designed category card widget for menu categories.
class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.category,
    required this.fetchCategoriesViewModel,
  });

  final Category category;
  final FetchCategoriesViewModel fetchCategoriesViewModel;

  static const double _cardHeight = 140.0;
  static const double _cardWidth = 220.0;
  static const double _borderRadius = 16.0;
  static const double _shadowBlurRadius = 12.0;
  static const double _shadowOffset = 4.0;
  static const double _shadowOpacity = 0.15;
  static const double _gradientOpacity = 0.7;
  static const double _iconSize = 60.0;
  static const double _textPadding = 12.0;
  static const double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductsRoute(categoryId: category.id).push<void>(context),
      child: Container(
        padding: const EdgeInsets.all(6),
        height: _cardHeight,
        width: _cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _shadowOpacity),
              blurRadius: _shadowBlurRadius,
              offset: const Offset(0, _shadowOffset),
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildCategoryImage(),
              _buildGradientOverlay(),
              _buildCategoryName(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the category image with error handling.
  Widget _buildCategoryImage() {
    return Image.asset(
      category.imageUrl,
      fit: BoxFit.cover,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  Icons.restaurant_menu,
                  size: _iconSize,
                  color: Colors.grey,
                ),
              ),
            );
          },
    );
  }

  /// Builds a gradient overlay for better text readability.
  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withValues(alpha: _gradientOpacity),
          ],
          stops: const [0.5, 1.0],
        ),
      ),
    );
  }

  /// Builds the category name text.
  Widget _buildCategoryName() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(_textPadding),
        child: Text(
          category.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: _fontSize,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
