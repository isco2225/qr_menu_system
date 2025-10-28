import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

import '../../../../app/app.dart';
import '../view_models/view_models.dart';

class CreateCategoryView extends StatefulWidget {
  const CreateCategoryView({super.key, required this.viewModel});

  final CreateCategoryViewModel viewModel;

  @override
  State<CreateCategoryView> createState() => _CreateCategoryViewState();
}

class _CreateCategoryViewState extends State<CreateCategoryView> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Listen to command result
    widget.viewModel.createCategory.result.addListener(_onResultChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    widget.viewModel.createCategory.result.removeListener(_onResultChanged);
    super.dispose();
  }

  void _onResultChanged() {
    final Result<void>? result = widget.viewModel.createCategory.result.value;

    if (result == null) return;

    switch (result) {
      case Ok():
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Category created successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          context.pop(); // Go back to admin panel
        }
      case Error():
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result.error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
    }
  }

  void _onSubmit() {
    final String name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter category name'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    widget.viewModel.createCategory.execute(name);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(title: const Text('Create Category'), centerTitle: true),
      body: ValueListenableBuilder<bool>(
        valueListenable: widget.viewModel.createCategory.running,
        builder: (context, isLoading, _) {
          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Category Name Field
                    AppTextField(
                      'Enter category name',
                      textEditingController: _nameController,
                      showText: 'Show',
                      hideText: 'Hide',
                      isReadOnly: isLoading,
                    ),
                    const SizedBox(height: 24),

                    // Image Picker Button
                    OutlinedButton.icon(
                      onPressed: isLoading
                          ? null
                          : () => widget.viewModel.pickImage.execute(),
                      icon: const Icon(Icons.image),
                      label: const Text('Pick Image'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Image Preview
                    ValueListenableBuilder(
                      valueListenable: widget.viewModel.imageBytes,
                      builder: (context, imageBytes, _) {
                        if (imageBytes == null) {
                          return Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'No image selected',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.memory(
                            imageBytes,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    AppGradientButton(
                      text: 'Create Category',
                      onPressed: isLoading ? null : _onSubmit,
                      isLoading: isLoading,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),

              // Loading Overlay
              if (isLoading)
                Container(
                  color: Colors.black26,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
