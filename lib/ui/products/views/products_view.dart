import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/widgets/base/base_scaffold.dart';

import '../../ui.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({
    super.key,
    required this.fetchProductsViewModel,
    required this.categoryId,
  });
  final FetchProductsViewModel fetchProductsViewModel;
  final int categoryId;

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: ProductAppBar(
        title: 'Products',
        onBackPressed: () {
          Future.delayed(const Duration(milliseconds: 250), () {
            if (!context.mounted || !context.canPop()) return;
            context.pop();
          });
        },
      ),
      body: InfinityScrollableProducts(
        categoryId: widget.categoryId,
        fetchProductsViewModel: widget.fetchProductsViewModel,
        noItemsToShowWidget: const SizedBox.shrink(),
        onFetch: () => widget.fetchProductsViewModel.fetchProducts.execute((
          categoryId: widget.categoryId,
        )),
        products: widget.fetchProductsViewModel.products,
        hasError: widget.fetchProductsViewModel.fetchProducts.error,
        isFetching: widget.fetchProductsViewModel.fetchProducts.running,
        isAllItemsFetched:
            widget.fetchProductsViewModel.fetchProducts.completed,
        productBuilder: (context, product) => ProductBox(
          product: product,
          fetchProductsViewModel: widget.fetchProductsViewModel,
        ),
      ),
    );
  }
}
