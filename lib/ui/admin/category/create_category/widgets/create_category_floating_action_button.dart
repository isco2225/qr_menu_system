import 'package:flutter/material.dart';
import 'package:qr_menu_system/app/app.dart';

class AddCategoryFloatingActionButton extends StatelessWidget {
  const AddCategoryFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        CreateCategoryRoute().go(context);
      },
      child: const Icon(Icons.add),
    );
  }
}
