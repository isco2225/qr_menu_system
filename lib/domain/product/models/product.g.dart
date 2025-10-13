// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String? ?? '',
  categoryId: json['categoryId'] as String? ?? '',
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  isActive: json['isActive'] as bool? ?? true,
  price: (json['price'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'name': instance.name,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'isActive': instance.isActive,
  'price': instance.price,
};
