import 'package:freezed_annotation/freezed_annotation.dart';

part 'scaled_image_urls_1024.freezed.dart';
part 'scaled_image_urls_1024.g.dart';

@freezed
class ScaledImageUrls1024 with _$ScaledImageUrls1024 {
  const factory ScaledImageUrls1024({
    required String url1024,
    required String url128,
    required String url256,
    required String url512,
  }) = _ScaledImageUrls1024;

  factory ScaledImageUrls1024.fromJson(Map<String, Object?> json) =>
      _$ScaledImageUrls1024FromJson(json);

  factory ScaledImageUrls1024.empty() => const ScaledImageUrls1024(
        url1024: "",
        url128: "",
        url256: "",
        url512: "",
      );
}
