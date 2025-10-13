import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
sealed class Category with _$Category {
  const factory Category({
    @Default('') String id,
    @Default('') String name,
    @Default('') String imageUrl,
    @Default(true) bool isActive,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
