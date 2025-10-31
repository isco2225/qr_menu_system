import 'package:formz/formz.dart';

import '../../../app/app.dart';

class VerificationCode extends FormzInput<String, ValueObjectFailure> {
  const VerificationCode.pure() : super.pure('');
  const VerificationCode.dirty({String value = ''}) : super.dirty(value);

  @override
  ValueObjectFailure? validator(String value) {
    if (value.isEmpty) {
      return VerificationCodeEmpty();
    } else if (value.length != 4) {
      return VerificationCodeLengthIncorrect();
    }
    return null;
  }
}

sealed class VerificationCodeValueObjectFailure implements ValueObjectFailure {}

class VerificationCodeEmpty extends VerificationCodeValueObjectFailure {}

class VerificationCodeLengthIncorrect
    extends VerificationCodeValueObjectFailure {}
