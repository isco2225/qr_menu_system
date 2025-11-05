import 'package:flutter/material.dart';
import 'package:shared/widgets/base/base_scaffold.dart';

import '../../../../app/app.dart';
import '../../../ui.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.fetchAdminViewModel,
    required this.fetchCategoriesViewModel,
  });
  final FetchAdminViewModel fetchAdminViewModel;
  final FetchCategoriesViewModel fetchCategoriesViewModel;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CreateCategoryRoute().go(context);
        },
        child: const Icon(Icons.add),
      ),

      body: InfinityScrollableAdminCategories(
        fetchCategoriesViewModel: fetchCategoriesViewModel,
        categories: fetchCategoriesViewModel.categories,
        hasError: fetchCategoriesViewModel.fetchCategories.error,
        isFetching: fetchCategoriesViewModel.fetchCategories.running,
        isAllItemsFetched: fetchCategoriesViewModel.fetchCategories.completed,
        noItemsToShowWidget: const CategoryNoItem(),
        onFetch: () => fetchCategoriesViewModel.fetchCategories.execute((
          admin: fetchAdminViewModel.admin.value,
        )),
        adminUser: fetchAdminViewModel.admin.value!,
      ),
    );
  }
}
