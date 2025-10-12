import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../app.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    super.key,
    required this.categoriesRepository,
    required this.productsRepository,
  });
  final CategoryRepository categoriesRepository;
  final ProductRepository productsRepository;

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late final FetchCategoriesViewModel _fetchCategoriesViewModel;

  @override
  void initState() {
    super.initState();
    _fetchCategoriesViewModel = FetchCategoriesViewModel(
      categoryRepository: widget.categoriesRepository,
    );
    _fetchCategoriesViewModel.fetchCategories.execute(); // start loading
  }

  @override
  void dispose() {
    super.dispose();
    _fetchCategoriesViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => widget.categoriesRepository),
        Provider(create: (_) => widget.productsRepository),
      ],
      child: ValueListenableBuilder<bool>(
        valueListenable: _fetchCategoriesViewModel.fetchCategories.running,
        builder: (context, running, child) {
          switch (running) {
            case true:
              return const AppInitializingView();
            case false:
              return AppView();
          }
        },
      ),
    );
  }
}
