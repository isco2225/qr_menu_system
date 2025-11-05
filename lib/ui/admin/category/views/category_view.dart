import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/widgets/base/base_scaffold.dart';
import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../ui.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late final FetchAdminViewModel fetchAdminViewModel;
  late final SignOutViewModel signOutViewModel;
  late final FetchCategoriesViewModel fetchCategoriesViewModel;

  @override
  void initState() {
    super.initState();
    fetchAdminViewModel = FetchAdminViewModel(
      adminRepository: context.read<AdminRepository>(),
    );
    signOutViewModel = SignOutViewModel(
      adminRepository: context.read<AdminRepository>(),
    );
    fetchCategoriesViewModel = FetchCategoriesViewModel(
      categoryRepository: context.read<CategoryRepository>(),
    );
    signOutViewModel.signOut.handleError(context);
    signOutViewModel.signOut.handleCompleted(
      context,
      onCompleted: (result) {
        CreateCategoryRoute().go(context);
      },
    );
    fetchCategoriesViewModel.fetchCategories.execute((
      admin: fetchAdminViewModel.admin.value,
    ));
  }

  @override
  void dispose() {
    fetchAdminViewModel.dispose();
    signOutViewModel.dispose();
    fetchCategoriesViewModel.dispose();
    super.dispose();
  }

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
