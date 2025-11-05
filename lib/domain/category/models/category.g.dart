// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  isActive: json['isActive'] as bool? ?? true,
  admin: json['admin'] == null
      ? null
      : AdminUser.fromJson(json['admin'] as Map<String, dynamic>),
  createdAtMilliseconds: (json['createdAtMilliseconds'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'isActive': instance.isActive,
  'admin': instance.admin,
  'createdAtMilliseconds': instance.createdAtMilliseconds,
};
