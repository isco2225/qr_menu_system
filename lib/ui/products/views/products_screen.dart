import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import '../../ui.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.categoryId});
  final String categoryId;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
    return ProductsView(
      fetchProductsViewModel: fetchProductsViewModel,
      categoryId: widget.categoryId,
    );
  }
}
