import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
sealed class Category with _$Category {
  const factory Category({
    @Default('') String id,
    @Default('') String name,
    @Default('') String imageUrl,
    @Default(true) bool isActive,
    @Default(null) AdminUser? admin,
    @Default(-1) int createdAtMilliseconds,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
