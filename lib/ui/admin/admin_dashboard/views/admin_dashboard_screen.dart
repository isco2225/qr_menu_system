import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_menu_system/data/repositories/category/category_repository.dart';
import 'package:qr_menu_system/ui/admin/admin.dart';
import 'package:qr_menu_system/ui/categories/categories.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
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
    return AdminDashboardView(
      fetchCategoriesViewModel: _fetchCategoriesViewModel,
    );
  }
}
