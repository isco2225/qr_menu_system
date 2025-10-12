import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_web_menu_alshami_alasl/ui/categories/categories.dart';

import '../../../data/data.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late final FetchCategoriesViewModel _fetchCategoriesViewModel;

  @override
  void initState() {
    super.initState();
    _fetchCategoriesViewModel = FetchCategoriesViewModel(
      categoryRepository: context.read<CategoryRepository>(),
    );
  }

  @override
  void dispose() {
    _fetchCategoriesViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(),
      body: InfinityScrollableCategories(
        fetchCategoriesViewModel: _fetchCategoriesViewModel,
        categories: _fetchCategoriesViewModel.categories,
        hasError: _fetchCategoriesViewModel.fetchCategories.error,
        isFetching: _fetchCategoriesViewModel.fetchCategories.running,
        isAllItemsFetched: _fetchCategoriesViewModel.fetchCategories.completed,
        noItemsToShowWidget: const Center(
          child: Text('No categories available'),
        ),
        onFetch: () => _fetchCategoriesViewModel.fetchCategories.execute(),
      ),
    );
  }
}
