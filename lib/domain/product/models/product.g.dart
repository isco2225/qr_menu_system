// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num?)?.toInt() ?? -1,
  categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isActive: json['isActive'] as bool? ?? true,
  price: (json['price'] as num?)?.toDouble() ?? 0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'name': instance.name,
  'description': instance.description,
  'imageUrls': instance.imageUrls,
  'isActive': instance.isActive,
  'price': instance.price,
  'discount': instance.discount,
};
