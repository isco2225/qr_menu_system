import 'package:formz/formz.dart';

import '../../../app/app.dart';

class ProductName extends FormzInput<String, ValueObjectFailure> {
  const ProductName.pure() : super.pure('');
  const ProductName.dirty(super.value) : super.dirty();

  @override
  ValueObjectFailure? validator(String value) {
    if (value.isEmpty) return ProductNameEmpty();
    if (value.trim().length < 2) return ProductNameTooShort();
    if (value.trim().length > 20) return ProductNameTooLong();
    final RegExp allowed = RegExp(r"^[a-zA-Z0-9 \\-_'&(),.]+$");
    if (!allowed.hasMatch(value)) return ProductNameInvalid();
    return null;
  }
}

sealed class ProductNameValueObjectFailure implements ValueObjectFailure {}

class ProductNameEmpty extends ProductNameValueObjectFailure {}

class ProductNameTooShort extends ProductNameValueObjectFailure {}

class ProductNameTooLong extends ProductNameValueObjectFailure {}

class ProductNameInvalid extends ProductNameValueObjectFailure {}
