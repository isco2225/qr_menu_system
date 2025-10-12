import 'package:flutter/material.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductAppBar({
    super.key,
    required this.onBackPressed,
    required this.title,
  });
  final VoidCallback onBackPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: IconButton(
        onPressed: () {
          onBackPressed();
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
