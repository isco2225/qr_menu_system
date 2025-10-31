import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import '../../app/app.dart';

/// Service for uploading files to Firebase Storage
///
/// Complexity: O(n) where n is file size
class StorageService {
  FirebaseStorage get _storage => FirebaseStorage.instance;

  /// Uploads image to Firebase Storage
  ///
  /// [imageBytes] - Image data to upload
  /// [path] - Storage path (e.g., 'products/product_id/image.jpg')
  ///
  /// Returns download URL as [String]
  Future<Result<String>> uploadImage({
    required Uint8List imageBytes,
    required String path,
  }) async {
    try {
      print('uploading image to storage: $path');
      final Reference ref = _storage.ref().child(path);
      print('reference: $ref');
      final UploadTask uploadTask = ref.putData(
        imageBytes,
        SettableMetadata(contentType: 'image/jpeg'),
      );
      print('upload task: $uploadTask');
      final TaskSnapshot snapshot = await uploadTask;
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      print('download url: $downloadUrl');
      return Result.ok(downloadUrl);
    } catch (e) {
      print('failed to upload image: $e');
      return Result.error(Exception('Failed to upload image: $e'));
    }
  }

  /// Uploads multiple images to Firebase Storage
  ///
  /// [imageBytesList] - List of image data to upload
  /// [basePath] - Base storage path (e.g., 'products/product_id')
  ///
  /// Returns List of download URLs
  /*Future<List<String>> uploadMultipleImages({
    required List<Uint8List> imageBytesList,
    required String basePath,
  }) async {
    final List<String> downloadUrls = [];

    for (int i = 0; i < imageBytesList.length; i++) {
      final String path = '$basePath/image_$i.jpg';
      final String url = await uploadImage(
        imageBytes: imageBytesList[i],
        path: path,
      );
      downloadUrls.add(url);
    }

    return downloadUrls;
  }*/

  /// Deletes an image from Firebase Storage
  ///
  /// [imageUrl] - Full download URL of the image to delete
  Future<void> deleteImage({required String imageUrl}) async {
    try {
      final Reference ref = _storage.refFromURL(imageUrl);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete image: $e');
    }
  }
}
