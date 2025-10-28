// This use case will be used to compress the image and upload it to the firebase by using the repository
import 'dart:typed_data';

import '../../../app/app.dart';
import '../../../data/data.dart';

class UploadCategoryImageUseCase {
  UploadCategoryImageUseCase({
    required ImageCompressionService compressionService,
    required CategoryRepository categoryRepository,
  }) : _imageCompressionService = compressionService,
       _categoryRepository = categoryRepository;
  final ImageCompressionService _imageCompressionService;
  final CategoryRepository _categoryRepository;

  Future<Result<String>> call({
    required Uint8List imageBytes,
    int quality = 85,
  }) async {
    try {
      // 1. Compress the image
      final Uint8List compressed = await _imageCompressionService.compress(
        imageBytes: imageBytes,
        quality: quality,
      );

      // 2. Upload the image to the storage
      final result = await _categoryRepository.uploadCategoryImage(
        imageBytes: compressed,
      );
      switch (result) {
        case Ok():
          return Result.ok(result.value);
        case Error():
          return Result.error(
            Exception('Failed to upload category image: ${result.error}'),
          );
      }
    } catch (e) {
      return Result.error(Exception('Upload failed: $e'));
    }
  }
}
