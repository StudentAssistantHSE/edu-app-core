import 'package:formz/formz.dart';

enum BioValidationError { undefined }

class BioField extends FormzInput<String?, BioValidationError> {
  const BioField.pure([ super.value ]) : super.pure();
  const BioField.dirty([ super.value = '' ]) : super.dirty();

  @override
  BioValidationError? validator(String? value) {
    return null;
  }
}