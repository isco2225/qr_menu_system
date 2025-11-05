import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_menu_system/ui/ui.dart';

import '../../../../data/data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final FetchAdminViewModel _fetchAdminViewModel;
  late final FetchCategoriesViewModel _fetchCategoriesViewModel;
  @override
  void initState() {
    super.initState();
    _fetchAdminViewModel = FetchAdminViewModel(
      adminRepository: context.read<AdminRepository>(),
    );
    _fetchCategoriesViewModel = FetchCategoriesViewModel(
      categoryRepository: context.read<CategoryRepository>(),
    );
    _fetchCategoriesViewModel.fetchCategories.execute((
      admin: _fetchAdminViewModel.admin.value,
    ));
  }

  @override
  void dispose() {
    _fetchAdminViewModel.dispose();
    _fetchCategoriesViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CategoryView(
      fetchAdminViewModel: _fetchAdminViewModel,
      fetchCategoriesViewModel: _fetchCategoriesViewModel,
    );
  }
}
