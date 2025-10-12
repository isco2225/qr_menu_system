import 'package:flutter/material.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Categories'),
      centerTitle: true,
      leading: Image.asset('assets/app_logo.png', fit: BoxFit.cover),
      forceMaterialTransparency: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
