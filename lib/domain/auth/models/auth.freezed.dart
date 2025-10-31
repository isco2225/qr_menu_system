// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Auth implements DiagnosticableTreeMixin {

 int get id; String get email;
/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCopyWith<Auth> get copyWith => _$AuthCopyWithImpl<Auth>(this as Auth, _$identity);

  /// Serializes this Auth to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Auth'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('email', email));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Auth&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Auth(id: $id, email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthCopyWith<$Res>  {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) _then) = _$AuthCopyWithImpl;
@useResult
$Res call({
 int id, String email
});




}
/// @nodoc
class _$AuthCopyWithImpl<$Res>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._self, this._then);

  final Auth _self;
  final $Res Function(Auth) _then;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Auth extends Auth with DiagnosticableTreeMixin {
  const _Auth({required this.id, required this.email}): super._();
  factory _Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

@override final  int id;
@override final  String email;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCopyWith<_Auth> get copyWith => __$AuthCopyWithImpl<_Auth>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Auth'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('email', email));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Auth&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Auth(id: $id, email: $email)';
}


}

/// @nodoc
abstract mixin class _$AuthCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$AuthCopyWith(_Auth value, $Res Function(_Auth) _then) = __$AuthCopyWithImpl;
@override @useResult
$Res call({
 int id, String email
});




}
/// @nodoc
class __$AuthCopyWithImpl<$Res>
    implements _$AuthCopyWith<$Res> {
  __$AuthCopyWithImpl(this._self, this._then);

  final _Auth _self;
  final $Res Function(_Auth) _then;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,}) {
  return _then(_Auth(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
