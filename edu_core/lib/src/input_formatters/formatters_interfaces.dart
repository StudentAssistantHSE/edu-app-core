import 'package:edu_core/src/input_formatters/formatters_with_callback.dart';
import 'package:flutter/services.dart';

abstract class TextInputFormatterInterface {
  final InfluenceAction? influenceAction;

  const TextInputFormatterInterface({ this.influenceAction });

  TextInputFormatterWithInfluenceResult toFormatter();
}

class FunctionTextInputFormatterInterface extends TextInputFormatterInterface {
  final TextInputFormatFunction formatFunction;

  const FunctionTextInputFormatterInterface(
    this.formatFunction, {
    super.influenceAction,
  });

  @override
  TextInputFormatterWithInfluenceResult toFormatter() =>
      FunctionTextInputFormatterWithInfluenceResult(
        formatFunction,
        influenceAction: influenceAction,
      );
}

class FilteringTextInputFormatterInterface extends TextInputFormatterInterface {
  final Pattern filterPattern;
  final bool allow;
  final String replacementString;

  const FilteringTextInputFormatterInterface(
    this.filterPattern, {
    required this.allow,
    this.replacementString = '',
    super.influenceAction,
  });

  const FilteringTextInputFormatterInterface.allow(
    this.filterPattern, {
    this.replacementString = '',
        super.influenceAction,
  }) : allow = true;

  const FilteringTextInputFormatterInterface.deny(
    this.filterPattern, {
    this.replacementString = '',
    super.influenceAction,
  }) : allow = false;

  @override
  TextInputFormatterWithInfluenceResult toFormatter() =>
      FilteringTextInputFormatterWithInfluenceResult(
        filterPattern,
        allow: allow,
        replacementString: replacementString,
        influenceAction: influenceAction,
      );
}

class LengthLimitingTextInputFormatterInterface extends TextInputFormatterInterface {
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;

  LengthLimitingTextInputFormatterInterface(
    this.maxLength, {
    this.maxLengthEnforcement,
    super.influenceAction,
  }) : assert(maxLength == null || maxLength == -1 || maxLength > 0);

  @override
  TextInputFormatterWithInfluenceResult toFormatter() =>
      LengthLimitingTextInputFormatterWithInfluenceResult(
        maxLength,
        maxLengthEnforcement: maxLengthEnforcement,
        influenceAction: influenceAction,
      );
}
