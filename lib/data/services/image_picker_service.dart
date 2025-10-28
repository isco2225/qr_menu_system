import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

/// Service for picking images from the web platform
///
/// Complexity: O(1) for initiating file picker dialog
class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// Picks a single image from user's device
  ///
  /// Returns [Uint8List] of image bytes or null if cancelled
  Future<Uint8List?> pickImage() async {
    try {
      final result = await _picker.pickImage(source: ImageSource.gallery);
      if (result == null) return null;

      final bytes = await result.readAsBytes();
      return bytes;
    } catch (e) {
      throw Exception('Failed to pick image: $e');
    }
  }

  /// Picks multiple images from user's device
  ///
  /// Returns List of [Uint8List] or empty list if cancelled
  Future<List<Uint8List>> pickMultipleImages() async {
    try {
      final results = await _picker.pickMultiImage();

      if (results.isEmpty) return [];

      final List<Uint8List> imageBytesList = [];
      for (final file in results) {
        final bytes = await file.readAsBytes();
        imageBytesList.add(bytes);
      }

      return imageBytesList;
    } catch (e) {
      throw Exception('Failed to pick multiple images: $e');
    }
  }
}
