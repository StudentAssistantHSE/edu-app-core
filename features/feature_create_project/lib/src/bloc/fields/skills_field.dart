import 'package:formz/formz.dart';

enum SkillsValidationError { undefined }

class SkillsField extends FormzInput<String, SkillsValidationError> {
  const SkillsField.pure([ super.value = '' ]) : super.pure();
  const SkillsField.dirty([ super.value = '' ]) : super.dirty();

  @override
  SkillsValidationError? validator(String? value) {
    return null;
  }
}