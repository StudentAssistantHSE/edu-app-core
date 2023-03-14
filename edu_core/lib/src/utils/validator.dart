import 'package:edu_core/src/utils/reg_exp_utils.dart';

enum ValidatorState {
  valid,
  noMatch,
  tooLong,
  tooShort,
  empty,
  lessThanMin,
  greaterThanMax,
}

extension ValidatorStateX on ValidatorState {
  bool get isValid => this == ValidatorState.valid;
  bool get isEmpty => this == ValidatorState.empty;
}

abstract class Validator<T> {
  final ValidatorState? ifEmptyResult;

  const Validator({
    this.ifEmptyResult,
  });

  ValidatorState validate(T? value);
}

class NumberValidator extends Validator<num> {
  final num? min;
  final num? max;

  const NumberValidator._({
    this.min,
    this.max,
    super.ifEmptyResult,
  });

  factory NumberValidator.birthdayYear({
    ValidatorState? ifEmptyResult = ValidatorState.empty,
  }) => NumberValidator._(
    ifEmptyResult: ifEmptyResult,
    min: 1900,
    max: DateTime.now().year,
  );

  @override
  ValidatorState validate(num? value) {
    final emptyResult = ifEmptyResult;
    if (emptyResult != null && value == null) {
      return emptyResult;
    }
    final min = this.min;
    if (min != null) {
      if (value == null || value < min) {
        return ValidatorState.lessThanMin;
      }
    }
    final max = this.max;
    if (max != null) {
      if (value != null && value > max) {
        return ValidatorState.greaterThanMax;
      }
    }

    return ValidatorState.valid;
  }
}

class StringValidator extends Validator<String> {
  final RegExp? regExp;
  final int? minLength;
  final int? maxLength;
  final bool trim;

  const StringValidator._({
    this.regExp,
    this.minLength,
    this.maxLength,
    this.trim = false,
    super.ifEmptyResult,
  });

  factory StringValidator.email({
    ValidatorState? ifEmptyResult = ValidatorState.empty,
  }) => StringValidator._(
    ifEmptyResult: ifEmptyResult,
    trim: true,
    regExp: RegExpUtils.emailString,
  );

  factory StringValidator.password({
    ValidatorState? ifEmptyResult = ValidatorState.empty,
  }) => StringValidator._(
    ifEmptyResult: ifEmptyResult,
    minLength: 8,
    maxLength: 128,
    regExp: RegExpUtils.passwordString,
  );

  factory StringValidator.notEmpty() => const StringValidator._(
    ifEmptyResult: ValidatorState.empty,
    minLength: 1,
    trim: true,
  );

  factory StringValidator.minLength({
    required int minLength,
    ValidatorState? ifEmptyResult = ValidatorState.lessThanMin,
  }) => StringValidator._(
    ifEmptyResult: ifEmptyResult,
    minLength: minLength,
    trim: true,
  );

  factory StringValidator.username({
    ValidatorState? ifEmptyResult = ValidatorState.empty,
  }) => StringValidator._(
    ifEmptyResult: ifEmptyResult,
    minLength: 3,
    maxLength: 32,
    trim: true,
    regExp: RegExpUtils.usernameString,
  );

  @override
  ValidatorState validate(String? value) {
    var preparedValue = value ?? '';
    if (trim) {
      preparedValue = preparedValue.trim();
    }
    final emptyResult = ifEmptyResult;
    if (emptyResult != null && preparedValue.isEmpty) {
      return emptyResult;
    }

    final minLength = this.minLength;
    if (minLength != null && preparedValue.length < minLength) {
      return ValidatorState.tooShort;
    }

    final maxLength = this.maxLength;
    if (maxLength != null && preparedValue.length > maxLength) {
      return ValidatorState.tooLong;
    }

    if (regExp?.hasMatch(preparedValue) == false) {
      return ValidatorState.noMatch;
    }

    return ValidatorState.valid;
  }
}