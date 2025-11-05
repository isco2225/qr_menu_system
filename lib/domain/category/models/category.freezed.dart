// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Category {

 String get id; String get name; String get imageUrl; bool get isActive; AdminUser? get admin; int get createdAtMilliseconds;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.createdAtMilliseconds, createdAtMilliseconds) || other.createdAtMilliseconds == createdAtMilliseconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,isActive,admin,createdAtMilliseconds);

@override
String toString() {
  return 'Category(id: $id, name: $name, imageUrl: $imageUrl, isActive: $isActive, admin: $admin, createdAtMilliseconds: $createdAtMilliseconds)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String imageUrl, bool isActive, AdminUser? admin, int createdAtMilliseconds
});


$AdminUserCopyWith<$Res>? get admin;

}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? isActive = null,Object? admin = freezed,Object? createdAtMilliseconds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as AdminUser?,createdAtMilliseconds: null == createdAtMilliseconds ? _self.createdAtMilliseconds : createdAtMilliseconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminUserCopyWith<$Res>? get admin {
    if (_self.admin == null) {
    return null;
  }

  return $AdminUserCopyWith<$Res>(_self.admin!, (value) {
    return _then(_self.copyWith(admin: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Category implements Category {
  const _Category({this.id = '', this.name = '', this.imageUrl = '', this.isActive = true, this.admin = null, this.createdAtMilliseconds = -1});
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String imageUrl;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  AdminUser? admin;
@override@JsonKey() final  int createdAtMilliseconds;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.createdAtMilliseconds, createdAtMilliseconds) || other.createdAtMilliseconds == createdAtMilliseconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,isActive,admin,createdAtMilliseconds);

@override
String toString() {
  return 'Category(id: $id, name: $name, imageUrl: $imageUrl, isActive: $isActive, admin: $admin, createdAtMilliseconds: $createdAtMilliseconds)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String imageUrl, bool isActive, AdminUser? admin, int createdAtMilliseconds
});


@override $AdminUserCopyWith<$Res>? get admin;

}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? isActive = null,Object? admin = freezed,Object? createdAtMilliseconds = null,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as AdminUser?,createdAtMilliseconds: null == createdAtMilliseconds ? _self.createdAtMilliseconds : createdAtMilliseconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminUserCopyWith<$Res>? get admin {
    if (_self.admin == null) {
    return null;
  }

  return $AdminUserCopyWith<$Res>(_self.admin!, (value) {
    return _then(_self.copyWith(admin: value));
  });
}
}

// dart format on
