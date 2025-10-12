// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: (json['id'] as num?)?.toInt() ?? -1,
  name: json['name'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'isActive': instance.isActive,
};
