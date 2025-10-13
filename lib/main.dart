import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_menu_system/firebase_options.dart';
import 'app/app.dart';
import 'data/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
