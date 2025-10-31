import 'package:formz/formz.dart';
import '../../../app/app.dart';

class Name extends FormzInput<String, ValueObjectFailure> {
  const Name.pure() : super.pure('');
  const Name.dirty(super.value) : super.dirty();

  @override
  ValueObjectFailure? validator(String value) {
    if (isPure) {
      return NameEmpty();
    }
    if (value.length < 2) {
      return NameTooShort();
    }

    if (value.length > 10) {
      return NameTooLong();
    }

    if (value.contains(RegExp('[^a-zA-Z]'))) {
      return NameContainsSpecialCharacter();
    }

    return null;
  }
}

sealed class NameValueObjectFailure implements ValueObjectFailure {}

class NameEmpty extends NameValueObjectFailure {}

class NameTooShort extends NameValueObjectFailure {}

class NameTooLong extends NameValueObjectFailure {}

class NameContainsSpecialCharacter extends NameValueObjectFailure {}
