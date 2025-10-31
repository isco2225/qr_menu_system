import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_exception.freezed.dart';

@freezed
sealed class ImageException with _$ImageException implements Exception {
  /// Unknown image error
  const factory ImageException.unknown() = ImageExceptionUnknown;
  const factory ImageException.couldNotCompressed() =
      ImageExceptionImageCouldNotCompressed;

  /// Too many images selected
  const factory ImageException.tooMuchImageSelected(int maximumImageLength) =
      ImageExceptionTooMuchImageSelected;

  /// Not enough images selected
  const factory ImageException.notEnoughImages(int minimumImageLength) =
      ImageExceptionNotEnoughImages;

  /// Images could not be saved
  const factory ImageException.imagesCouldNotBeSaved() = ImagesCouldNotBeSaved;
}
