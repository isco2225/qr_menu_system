import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:qr_menu_system/firebase_options.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app/app.dart';
import 'data/data.dart';

void main() async {
  usePathUrlStrategy(); //for web path.
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    AppScreen(
      categoriesRepository: CategoryRepositoryRemote(
        categoriesService: CategoriesService(),
        storageService: StorageService(),
      ),
      productsRepository: ProductRepositoryRemote(
        productsService: ProductsService(),
      ),
      adminRepository: AdminRepositoryRemote(adminService: AdminService()),
    ),
  );
}
