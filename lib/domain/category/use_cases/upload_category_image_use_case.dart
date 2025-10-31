// This use case will be used to compress the image and upload it to the firebase by using the repository
import 'dart:typed_data';

import 'package:logging/logging.dart';

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
  final Logger _log = Logger('UploadCategoryImageUseCase');

  Future<Result<String>> call({
    required Uint8List imageBytes,
    int quality = 85,
  }) async {
    try {
      // 1. Compress the image
      _log.info('Compressing image');
      final Uint8List compressed = await _imageCompressionService.compress(
        imageBytes: imageBytes,
        quality: quality,
      );

      // 2. Upload the image to the storage
      _log.info('Uploading image to storage');
      final result = await _categoryRepository.uploadCategoryImage(
        imageBytes: compressed,
      );
      switch (result) {
        case Ok():
          _log.info('Image uploaded successfully');
          return Result.ok(result.value);
        case Error():
          _log.warning('Failed to upload category image: ${result.error}');
          return Result.error(
            Exception('Failed to upload category image: ${result.error}'),
          );
      }
    } catch (e) {
      _log.warning('Failed to upload category image: $e');
      return Result.error(Exception('Upload failed: $e'));
    }
  }
}
