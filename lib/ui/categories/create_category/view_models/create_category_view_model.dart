import 'package:flutter/foundation.dart' hide Category;
import 'package:logging/logging.dart';

import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class CreateCategoryViewModel {
  CreateCategoryViewModel({
    required ImagePickerService imagePickerService,
    required CategoryRepository categoryRepository,
    required UploadCategoryImageUseCase uploadCategoryImageUseCase,
  }) : _imagePickerService = imagePickerService,
       _categoryRepository = categoryRepository,
       _uploadCategoryImageUseCase = uploadCategoryImageUseCase {
    createCategory = Command1(_createCategory, debugLabel: 'createCategory');
    pickImage = Command0(_pickImage, debugLabel: 'pickImage');
  }

  // LOGGER
  final _log = Logger('CreateCategoryViewModel');
  // REPOSITORIES & USE CASES
  final ImagePickerService _imagePickerService;
  final CategoryRepository _categoryRepository;
  final UploadCategoryImageUseCase _uploadCategoryImageUseCase;
  // DOMAIN
  final ValueNotifier<Uint8List?> _imageBytes = ValueNotifier<Uint8List?>(null);
  ValueListenable<Uint8List?> get imageBytes => _imageBytes;

  // COMMANDS
  late Command1<void, String> createCategory;
  late Command0<void> pickImage;

  // DISPOSE
  void dispose() {
    createCategory.dispose();
    pickImage.dispose();
    _imageBytes.dispose();
    _log.fine('Disposed');
  }

  // FUNCTIONS
  Future<Result<void>> _createCategory(String name) async {
    try {
      if (_imageBytes.value == null) {
        _log.warning('No image selected');
        return Result.error(Exception('No image selected'));
      }
      final imageResult = await _uploadCategoryImageUseCase.call(
        imageBytes: _imageBytes.value!,
      );
      switch (imageResult) {
        case Ok():
          break;
        case Error():
          return Result.error(
            Exception('Failed to upload category image: ${imageResult.error}'),
          );
      }
      final categoryResult = await _categoryRepository.createCategory(
        imageUrl: imageResult.asOk.value,
        name: name,
        isActive: true,
      );
      switch (categoryResult) {
        case Ok():
          _imageBytes.value = null; // Clear image after success
          _log.info('Category created: ${categoryResult.value.id}');
          return Result.ok(null);
        case Error():
          return Result.error(
            Exception('Failed to create category: ${categoryResult.error}'),
          );
      }
    } catch (e) {
      return Result.error(Exception('Failed to create category: $e'));
    }
  }

  Future<Result<void>> _pickImage() async {
    try {
      final Uint8List? imageBytes = await _imagePickerService.pickImage();
      if (imageBytes == null) {
        _log.warning('No image selected');
        return Result.error(Exception('No image selected'));
      }
      _imageBytes.value = imageBytes;
      return Result.ok(null);
    } catch (e) {
      _log.warning('Failed to pick image', e);
      return Result.error(Exception('Failed to pick image: $e'));
    }
  }
}
