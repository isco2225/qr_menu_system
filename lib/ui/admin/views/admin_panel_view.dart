import 'package:flutter/material.dart';
import 'package:shared/widgets/base/base_scaffold.dart';

import '../../ui.dart';

class AdminPanelView extends StatefulWidget {
  const AdminPanelView({
    super.key,
    required this.fetchAdminViewModel,
    required this.signOutViewModel,
    required this.fetchCategoriesViewModel,
  });
  final FetchAdminViewModel fetchAdminViewModel;
  final SignOutViewModel signOutViewModel;
  final FetchCategoriesViewModel fetchCategoriesViewModel;
  @override
  State<AdminPanelView> createState() => _AdminPanelViewState();
}

class _AdminPanelViewState extends State<AdminPanelView> {
  // @override
  // void initState() {
  //   super.initState();
  //   widget.fetchCategoriesViewModel.fetchCategories.execute();
  // }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://ui-avatars.com/api/?name=${widget.fetchAdminViewModel.admin.value?.name ?? ''}',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              widget.signOutViewModel.signOut.execute();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),

      body: InfinityScrollableCategories(
        fetchCategoriesViewModel: widget.fetchCategoriesViewModel,
        categories: widget.fetchCategoriesViewModel.categories,
        hasError: widget.fetchCategoriesViewModel.fetchCategories.error,
        isFetching: widget.fetchCategoriesViewModel.fetchCategories.running,
        isAllItemsFetched:
            widget.fetchCategoriesViewModel.fetchCategories.completed,
        noItemsToShowWidget: const CategoryNoItem(),
        onFetch: () =>
            widget.fetchCategoriesViewModel.fetchCategories.execute(),
      ),
    );
  }
}
