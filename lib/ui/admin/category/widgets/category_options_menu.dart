import 'package:flutter/material.dart';

class CategoryOptionsMenu extends StatelessWidget {
  const CategoryOptionsMenu({super.key, required this.isCategoryVisible});
  final bool isCategoryVisible;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      icon: Icon(Icons.more_vert, color: Colors.red),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.edit_outlined),
            title: Text('Edit'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(
              isCategoryVisible ? Icons.visibility : Icons.visibility_off,
            ),
            title: Text('Preview'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.delete_outline_rounded, color: Colors.red),
            title: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
