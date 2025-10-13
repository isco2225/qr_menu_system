import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../../../domain/domain.dart';
import '../../../ui.dart';

class InfinityScrollableProducts extends StatefulWidget {
  const InfinityScrollableProducts({
    required this.categoryId,
    required this.fetchProductsViewModel,
    required this.noItemsToShowWidget,
    required this.onFetch,
    required this.products,
    required this.hasError,
    required this.isFetching,
    required this.isAllItemsFetched,
    required this.productBuilder,
    super.key,
  });
  final String categoryId;
  final FetchProductsViewModel fetchProductsViewModel;
  final Widget noItemsToShowWidget;
  final VoidCallback onFetch;
  final ValueListenable<List<Product>> products;
  final ValueListenable<bool> hasError;
  final ValueListenable<bool> isFetching;
  final ValueListenable<bool> isAllItemsFetched;
  final Widget Function(BuildContext, Product) productBuilder;

  @override
  State<InfinityScrollableProducts> createState() =>
      _InfinityScrollableProductsState();
}

class _InfinityScrollableProductsState
    extends State<InfinityScrollableProducts> {
  @override
  void initState() {
    super.initState();
    widget.fetchProductsViewModel.fetchProducts.execute((
      categoryId: widget.categoryId,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.products,
      builder: (context, child) {
        return InfinityScrollable.listView(
          scrollController: null,
          bottomPadding: 8,
          initializeFailureWidget: const SizedBox.shrink(),
          fetchMoreFailureWidget: const SizedBox.shrink(),
          itemCount: widget.products.value.length,
          itemBuilder: (context, index) {
            final product = widget.products.value[index];
            return widget.productBuilder.call(context, product);
          },
          isFetching: widget.isFetching.value,
          onFetchMore: () => widget.onFetch(),
          isAllItemsFetched: widget.isAllItemsFetched.value,
          fetchingFirstItems: const Center(child: CircularProgressIndicator()),
          fetchingMoreItemsWidget: const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          ),
          noItemsToShowWidget: widget.noItemsToShowWidget,
          hasError: widget.hasError.value,
        );
      },
    );
  }
}
