import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
sealed class Product with _$Product {
  const factory Product({
    @Default('') String id,
    @Default('') String categoryId,
    @Default('') String name,
    @Default('') String description,
    @Default('') String imageUrl,
    @Default(true) bool isActive,
    @Default(0) double price,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
