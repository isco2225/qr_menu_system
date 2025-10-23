// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUser _$AdminUserFromJson(Map<String, dynamic> json) => _AdminUser(
  uid: json['uid'] as String? ?? '',
  email: json['email'] as String? ?? '',
  name: json['name'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  role:
      $enumDecodeNullable(_$AdminUserRoleEnumMap, json['role']) ??
      AdminUserRole.superAdmin,
);

Map<String, dynamic> _$AdminUserToJson(_AdminUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'role': _$AdminUserRoleEnumMap[instance.role]!,
    };

const _$AdminUserRoleEnumMap = {
  AdminUserRole.superAdmin: 'superAdmin',
  AdminUserRole.admin: 'admin',
  AdminUserRole.viewer: 'viewer',
};
