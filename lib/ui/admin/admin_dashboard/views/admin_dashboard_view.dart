import 'package:flutter/material.dart';

import '../../../ui.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({
    super.key,
    required this.fetchCategoriesViewModel,
    required this.adminProductViewModel,
  });
  final FetchCategoriesViewModel fetchCategoriesViewModel;
  final AdminProductViewModel adminProductViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListenableBuilder(
            listenable: Listenable.merge([
              fetchCategoriesViewModel.categories,
              adminProductViewModel.productsCount,
            ]),
            builder: (context, _) {
              return Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'Categories',
                      count: fetchCategoriesViewModel.categories.value.length,
                    ),
                  ),
                  Expanded(
                    child: StatCard(
                      title: 'Products',
                      count: adminProductViewModel.productsCount.value,
                    ),
                  ),
                ],
              );
            },
          ),
          // ValueListenableBuilder(
          //   valueListenable: fetchCategoriesViewModel.categories,
          //   builder: (context, value, child) {},
          // ),
          Column(
            children: [
              Text(
                'Admins',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.green),
                  color: Colors.grey,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text(
                        'Ahmet',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text('Super Admin'),
                      trailing: Text('21.04.2025'),
                    ),
                    Divider(),
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
