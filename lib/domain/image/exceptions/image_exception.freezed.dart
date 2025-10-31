// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageException()';
}


}

/// @nodoc
class $ImageExceptionCopyWith<$Res>  {
$ImageExceptionCopyWith(ImageException _, $Res Function(ImageException) __);
}


/// @nodoc


class ImageExceptionUnknown implements ImageException {
  const ImageExceptionUnknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExceptionUnknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageException.unknown()';
}


}




/// @nodoc


class ImageExceptionImageCouldNotCompressed implements ImageException {
  const ImageExceptionImageCouldNotCompressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExceptionImageCouldNotCompressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageException.couldNotCompressed()';
}


}




/// @nodoc


class ImageExceptionTooMuchImageSelected implements ImageException {
  const ImageExceptionTooMuchImageSelected(this.maximumImageLength);
  

 final  int maximumImageLength;

/// Create a copy of ImageException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageExceptionTooMuchImageSelectedCopyWith<ImageExceptionTooMuchImageSelected> get copyWith => _$ImageExceptionTooMuchImageSelectedCopyWithImpl<ImageExceptionTooMuchImageSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExceptionTooMuchImageSelected&&(identical(other.maximumImageLength, maximumImageLength) || other.maximumImageLength == maximumImageLength));
}


@override
int get hashCode => Object.hash(runtimeType,maximumImageLength);

@override
String toString() {
  return 'ImageException.tooMuchImageSelected(maximumImageLength: $maximumImageLength)';
}


}

/// @nodoc
abstract mixin class $ImageExceptionTooMuchImageSelectedCopyWith<$Res> implements $ImageExceptionCopyWith<$Res> {
  factory $ImageExceptionTooMuchImageSelectedCopyWith(ImageExceptionTooMuchImageSelected value, $Res Function(ImageExceptionTooMuchImageSelected) _then) = _$ImageExceptionTooMuchImageSelectedCopyWithImpl;
@useResult
$Res call({
 int maximumImageLength
});




}
/// @nodoc
class _$ImageExceptionTooMuchImageSelectedCopyWithImpl<$Res>
    implements $ImageExceptionTooMuchImageSelectedCopyWith<$Res> {
  _$ImageExceptionTooMuchImageSelectedCopyWithImpl(this._self, this._then);

  final ImageExceptionTooMuchImageSelected _self;
  final $Res Function(ImageExceptionTooMuchImageSelected) _then;

/// Create a copy of ImageException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? maximumImageLength = null,}) {
  return _then(ImageExceptionTooMuchImageSelected(
null == maximumImageLength ? _self.maximumImageLength : maximumImageLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ImageExceptionNotEnoughImages implements ImageException {
  const ImageExceptionNotEnoughImages(this.minimumImageLength);
  

 final  int minimumImageLength;

/// Create a copy of ImageException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageExceptionNotEnoughImagesCopyWith<ImageExceptionNotEnoughImages> get copyWith => _$ImageExceptionNotEnoughImagesCopyWithImpl<ImageExceptionNotEnoughImages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExceptionNotEnoughImages&&(identical(other.minimumImageLength, minimumImageLength) || other.minimumImageLength == minimumImageLength));
}


@override
int get hashCode => Object.hash(runtimeType,minimumImageLength);

@override
String toString() {
  return 'ImageException.notEnoughImages(minimumImageLength: $minimumImageLength)';
}


}

/// @nodoc
abstract mixin class $ImageExceptionNotEnoughImagesCopyWith<$Res> implements $ImageExceptionCopyWith<$Res> {
  factory $ImageExceptionNotEnoughImagesCopyWith(ImageExceptionNotEnoughImages value, $Res Function(ImageExceptionNotEnoughImages) _then) = _$ImageExceptionNotEnoughImagesCopyWithImpl;
@useResult
$Res call({
 int minimumImageLength
});




}
/// @nodoc
class _$ImageExceptionNotEnoughImagesCopyWithImpl<$Res>
    implements $ImageExceptionNotEnoughImagesCopyWith<$Res> {
  _$ImageExceptionNotEnoughImagesCopyWithImpl(this._self, this._then);

  final ImageExceptionNotEnoughImages _self;
  final $Res Function(ImageExceptionNotEnoughImages) _then;

/// Create a copy of ImageException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minimumImageLength = null,}) {
  return _then(ImageExceptionNotEnoughImages(
null == minimumImageLength ? _self.minimumImageLength : minimumImageLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ImagesCouldNotBeSaved implements ImageException {
  const ImagesCouldNotBeSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagesCouldNotBeSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageException.imagesCouldNotBeSaved()';
}


}




// dart format on
