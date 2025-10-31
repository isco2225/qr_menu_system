import 'package:formz/formz.dart';
import '../../../app/app.dart';

import 'name.dart';

class ChangedName
    extends
        FormzInput<({Name newName, String currentName}), ValueObjectFailure> {
  const ChangedName.pure()
    : super.pure((newName: const Name.pure(), currentName: ''));
  const ChangedName.dirty(super.value) : super.dirty();

  @override
  ValueObjectFailure? validator(({Name newName, String currentName}) value) {
    if (isPure || value.newName.value == '') {
      return ChangedNameEmpty();
    }
    if (value.newName.isNotValid) {
      return value.newName.error;
    }

    if (value.newName.value == value.currentName) {
      return ChangedNameSameWithCurrentName();
    }

    return null;
  }
}

sealed class ChangedNameValueObjectFailure implements ValueObjectFailure {}

class ChangedNameEmpty extends ChangedNameValueObjectFailure {}

class ChangedNameSameWithCurrentName extends ChangedNameValueObjectFailure {}
