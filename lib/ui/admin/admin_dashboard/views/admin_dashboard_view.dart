import 'package:flutter/material.dart';

import '../../../ui.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key, required this.fetchCategoriesViewModel});
  final FetchCategoriesViewModel fetchCategoriesViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: fetchCategoriesViewModel.categories,
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'Categories',
                      count: fetchCategoriesViewModel.categories.value.length,
                    ),
                  ),
                  Expanded(child: StatCard(title: 'Products', count: 8)),
                ],
              );
            },
          ),
          Column(
            children: [
              Text(
                'Admins',
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Ahmet'),
                      subtitle: Text('Super Admin'),
                      trailing: Text('21.04.2025'),
                    ),
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Mehmet'),
                      subtitle: Text('Normal Admin'),
                      trailing: Text('22.05.2025'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
