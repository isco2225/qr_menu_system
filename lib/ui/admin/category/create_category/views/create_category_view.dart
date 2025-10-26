import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class CreateCategoryView extends StatefulWidget {
  const CreateCategoryView({super.key});

  @override
  State<CreateCategoryView> createState() => _CreateCategoryViewState();
}

class _CreateCategoryViewState extends State<CreateCategoryView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(title: Text('Create Category')),
      body: Column(
        children: [
          ListView(
            children: [
              Container(height: 100, width: 100, color: Colors.amberAccent),
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.blueAccent),
            ],
          ),
        ],
      ),
    );
  }
}
