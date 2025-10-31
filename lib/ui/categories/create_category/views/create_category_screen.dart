import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/data.dart';
import '../../../../domain/domain.dart';
import '../../../ui.dart';
import '../view_models/view_models.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  late final CreateCategoryViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CreateCategoryViewModel(
      imagePickerService: ImagePickerService(),
      categoryRepository: context.read<CategoryRepository>(),
      uploadCategoryImageUseCase: UploadCategoryImageUseCase(
        compressionService: ImageCompressionService(),
        categoryRepository: context.read<CategoryRepository>(),
      ),
    );
    _viewModel.createCategory.handleCompleted(
      context,
      onCompleted: (category) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Category created successfully')),
        );
      },
    );
    _viewModel.createCategory.handleError(context);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CreateCategoryView(viewModel: _viewModel);
  }
}
