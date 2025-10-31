// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Auth _$AuthFromJson(Map<String, dynamic> json) =>
    _Auth(id: (json['id'] as num).toInt(), email: json['email'] as String);

Map<String, dynamic> _$AuthToJson(_Auth instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
};
