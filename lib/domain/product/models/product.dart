import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
sealed class Product with _$Product {
  const factory Product({
    @Default(-1) int id,
    @Default(-1) int categoryId,
    @Default('') String name,
    @Default('') String description,
    @Default([]) List<String> imageUrls,
    @Default(true) bool isActive,
    @Default(0) double price,
    @Default(0) double discount,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
