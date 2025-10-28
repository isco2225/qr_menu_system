import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCompressionService {
  /// Default quality for compression (0-100)
  static const int defaultQuality = 85;

  /// Default max width in pixels
  static const int defaultMaxWidth = 1920;

  /// Default max height in pixels
  static const int defaultMaxHeight = 1920;

  /// Compresses image bytes to reduce file size
  ///
  /// [imageBytes] - Original image data
  /// [quality] - Compression quality (0-100), default 85
  /// [maxWidth] - Maximum width in pixels, default 1920
  /// [maxHeight] - Maximum height in pixels, default 1920
  ///
  /// Returns compressed [Uint8List] or null if compression fails
  Future<Uint8List> compress({
    required Uint8List imageBytes,
    int quality = defaultQuality,
    int maxWidth = defaultMaxWidth,
    int maxHeight = defaultMaxHeight,
  }) async {
    try {
      final Uint8List compressed = await FlutterImageCompress.compressWithList(
        imageBytes,
        quality: quality,
        minWidth: maxWidth,
        minHeight: maxHeight,
      );
      return compressed;
    } catch (e) {
      throw Exception('Failed to compress image: $e');
    }
  }

  /// Compresses multiple images in batch
  ///
  /// Returns List of compressed [Uint8List]
  Future<List<Uint8List>> compressMultiple({
    required List<Uint8List> imageBytesList,
    int quality = defaultQuality,
    int maxWidth = defaultMaxWidth,
    int maxHeight = defaultMaxHeight,
  }) async {
    final List<Uint8List> compressedList = [];

    for (final imageBytes in imageBytesList) {
      final compressed = await compress(
        imageBytes: imageBytes,
        quality: quality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
      compressedList.add(compressed);
    }

    return compressedList;
  }
}
