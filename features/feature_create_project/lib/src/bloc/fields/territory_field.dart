import 'package:formz/formz.dart';

enum TerritoryValidationError { undefined }

class TerritoryField extends FormzInput<String, TerritoryValidationError> {
  const TerritoryField.pure([ super.value = '' ]) : super.pure();
  const TerritoryField.dirty([ super.value = '' ]) : super.dirty();

  @override
  TerritoryValidationError? validator(String? value) {
    return null;
  }
}