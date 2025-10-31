import 'package:formz/formz.dart';

import '../../../app/app.dart';

class ProductDescription extends FormzInput<String, ValueObjectFailure> {
  const ProductDescription.pure() : super.pure('');
  const ProductDescription.dirty(super.value) : super.dirty();

  @override
  ValueObjectFailure? validator(String value) {
    if (isPure) {
      return ProductDescriptionEmpty();
    }
    if (value.length > 400) {
      return ProductDescriptionTooLong();
    }
    return null;
  }
}

sealed class ToyDescriptionValueObjectFailure implements ValueObjectFailure {}

class ProductDescriptionEmpty extends ToyDescriptionValueObjectFailure {}

class ProductDescriptionTooLong extends ToyDescriptionValueObjectFailure {}
