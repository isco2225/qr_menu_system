import 'package:flutter/material.dart';
import '../../../app/app.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Categories'),
      centerTitle: true,
      //leading: Image.asset('assets/app_logo.png', fit: BoxFit.cover),
      forceMaterialTransparency: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      actions: [
        IconButton(
          onPressed: () {
            SignInRoute().go(context);
          },
          icon: const Icon(Icons.admin_panel_settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
