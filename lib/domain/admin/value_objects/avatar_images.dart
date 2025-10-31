import 'package:formz/formz.dart';
import 'package:shared/shared.dart';

import '../../../app/app.dart';

class AvatarImages extends FormzInput<ScaledImages1024?, ValueObjectFailure> {
  const AvatarImages.pure() : super.pure(null);

  const AvatarImages.dirty({required ScaledImages1024? avatarImage1024})
    : super.dirty(avatarImage1024);

  @override
  AvatarImagesValueObjectFailure? validator(ScaledImages1024? value) {
    if (value == null) {
      return AvatarImagesEmpty();
    }
    if (value.size1024.lengthInBytes > 1024 * 1024) {
      return AvatarImagesSizeTooBig();
    }
    if (value.size512.lengthInBytes > 512 * 512) {
      return AvatarImagesSizeTooBig();
    }
    if (value.size256.lengthInBytes > 256 * 256) {
      return AvatarImagesSizeTooBig();
    }
    if (value.size128.lengthInBytes > 128 * 128) {
      return AvatarImagesSizeTooBig();
    }

    return null;
  }
}

sealed class AvatarImagesValueObjectFailure implements ValueObjectFailure {}

class AvatarImagesEmpty extends AvatarImagesValueObjectFailure {}

class AvatarImagesSizeTooBig extends AvatarImagesValueObjectFailure {}
