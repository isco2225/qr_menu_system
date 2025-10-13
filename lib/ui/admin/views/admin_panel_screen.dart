import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import '../../ui.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  late final FetchProductsViewModel fetchProductsViewModel;

  @override
  void initState() {
    super.initState();
    fetchProductsViewModel = FetchProductsViewModel(
      productRepository: context.read<ProductRepository>(),
    );
  }

  @override
  void dispose() {
    fetchProductsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdminPanelView();
  }
}
