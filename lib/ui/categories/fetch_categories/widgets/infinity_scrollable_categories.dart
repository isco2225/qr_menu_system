import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../../../domain/domain.dart';
import '../../../ui.dart';

class InfinityScrollableCategories extends StatefulWidget {
  const InfinityScrollableCategories({
    required this.fetchCategoriesViewModel,
    required this.noItemsToShowWidget,
    required this.onFetch,
    required this.categories,
    required this.hasError,
    required this.isFetching,
    required this.isAllItemsFetched,
    super.key,
  });
  final FetchCategoriesViewModel fetchCategoriesViewModel;
  final Widget noItemsToShowWidget;
  final VoidCallback onFetch;
  final ValueListenable<List<Category>> categories;
  final ValueListenable<bool> hasError;
  final ValueListenable<bool> isFetching;
  final ValueListenable<bool> isAllItemsFetched;
  @override
  State<InfinityScrollableCategories> createState() =>
      _InfinityScrollableCategoriesState();
}

class _InfinityScrollableCategoriesState
    extends State<InfinityScrollableCategories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.categories,
      builder: (context, child) {
        return InfinityScrollable.gridView(
          scrollController: null,
          bottomPadding: 8,
          initializeFailureWidget: const SizedBox.shrink(),
          fetchMoreFailureWidget: const SizedBox.shrink(),
          itemCount: widget.categories.value.length,
          itemBuilder: (context, index) {
            final category = widget.categories.value[index];
            return Center(
              child: CategoryBox(
                category: category,
                fetchCategoriesViewModel: widget.fetchCategoriesViewModel,
              ),
            );
          },
          isFetching: widget.isFetching.value,
          onFetchMore: () => widget.onFetch(),
          isAllItemsFetched: widget.isAllItemsFetched.value,
          fetchingFirstItems: const SizedBox.shrink(),
          fetchingMoreItemsWidget: const SizedBox.shrink(),
          noItemsToShowWidget: widget.noItemsToShowWidget,
          hasError: widget.hasError.value,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            mainAxisExtent: 160,
          ),
        );
      },
    );
  }
}
