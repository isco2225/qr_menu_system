import 'package:flutter/material.dart';

import 'app/app.dart';
import 'data/data.dart';

void main() {
  runApp(
    AppScreen(
      categoriesRepository: CategoryRepositoryRemote(
        categoriesService: CategoriesService(),
      ),
      productsRepository: ProductRepositoryRemote(
        productsService: ProductsService(),
      ),
    ),
  );
}
