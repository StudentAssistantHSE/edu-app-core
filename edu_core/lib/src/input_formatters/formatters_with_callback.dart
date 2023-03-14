import 'package:edu_core/src/input_formatters/formatters_interfaces.dart';
import 'package:edu_core/src/input_formatters/input_formatters.dart';
import 'package:flutter/services.dart';

typedef InfluenceCallback = void Function(InfluenceAction? influenceAction);

enum InfluenceAction {
  replaced,
  denied,
}

extension InfluenceActionX on InfluenceAction {
  bool get isDenied => this == InfluenceAction.denied;
}

class TextInputFormatterInfluenceResult {
  final TextEditingValue value;
  final InfluenceAction? action;

  const TextInputFormatterInfluenceResult(this.value, { this.action });
}

class ComposingTextInputFormatterWithInfluenceCallback extends TextInputFormatter {
  final List<TextInputFormatterWithInfluenceResult> formatters;
  final InfluenceCallback? influenceCallback;

  ComposingTextInputFormatterWithInfluenceCallback(
    List<TextInputFormatterInterface> interfaces, {
    this.influenceCallback,
  }) : formatters = interfaces.map((e) => e.toFormatter()).toList();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var currentValue = newValue;
    InfluenceAction? action;
    for (final formatter in formatters) {
      final result = formatter.formatWithInfluenceResult(oldValue, currentValue);
      currentValue = result.value;
      if (action == null) {
        action = result.action;
      } else if (!action.isDenied && result.action != null) {
        action = result.action;
      }
    }
    influenceCallback?.call(action);
    return currentValue;
  }
}

abstract class TextInputFormatterWithInfluenceResult extends TextInputFormatter {
  final InfluenceAction? influenceAction;

  TextInputFormatterWithInfluenceResult({
    this.influenceAction,
  });

  TextInputFormatterInfluenceResult formatWithInfluenceResult(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final formattedValue = formatEditUpdate(oldValue, newValue);
    return TextInputFormatterInfluenceResult(
      formattedValue,
      action: newValue.text != formattedValue.text ? influenceAction : null,
    );
  }
}

class FunctionTextInputFormatterWithInfluenceResult extends TextInputFormatterWithInfluenceResult {
  final TextInputFormatFunction formatFunction;

  FunctionTextInputFormatterWithInfluenceResult(
    this.formatFunction, {
    super.influenceAction,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) => formatFunction(oldValue, newValue);
}

class FilteringTextInputFormatterWithInfluenceResult
    extends FilteringTextInputFormatter
    implements TextInputFormatterWithInfluenceResult {
  @override
  final InfluenceAction? influenceAction;

  FilteringTextInputFormatterWithInfluenceResult(
    super.filterPattern, {
    required super.allow,
    super.replacementString = '',
    this.influenceAction,
  });

  FilteringTextInputFormatterWithInfluenceResult.allow(
    Pattern filterPattern, {
    String replacementString = '',
    this.influenceAction,
  }) : super.allow(filterPattern, replacementString: replacementString);

  FilteringTextInputFormatterWithInfluenceResult.deny(
    Pattern filterPattern, {
    String replacementString = '',
    this.influenceAction,
  }) : super.deny(filterPattern, replacementString: replacementString);

  @override
  TextInputFormatterInfluenceResult formatWithInfluenceResult(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final formattedValue = formatEditUpdate(oldValue, newValue);
    return TextInputFormatterInfluenceResult(
      formattedValue,
      action: newValue.text != formattedValue.text ? influenceAction : null,
    );
  }
}

class LengthLimitingTextInputFormatterWithInfluenceResult
    extends LengthLimitingTextInputFormatter
    implements TextInputFormatterWithInfluenceResult {
  @override
  final InfluenceAction? influenceAction;

  LengthLimitingTextInputFormatterWithInfluenceResult(
    super.maxLength, {
    super.maxLengthEnforcement,
    this.influenceAction,
  }) : assert(maxLength == null || maxLength == -1 || maxLength > 0);

  @override
  TextInputFormatterInfluenceResult formatWithInfluenceResult(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final formattedValue = formatEditUpdate(oldValue, newValue);
    return TextInputFormatterInfluenceResult(
      formattedValue,
      action: newValue.text != formattedValue.text ? influenceAction : null,
    );
  }
}
