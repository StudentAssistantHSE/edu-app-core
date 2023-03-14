import 'package:edu_core/src/input_formatters/input_formatters.dart';
import 'package:edu_core/src/utils/reg_exp_utils.dart';
import 'package:flutter/services.dart';

abstract class Formatters {
  static final TextInputFormatter replaceEllipsis = FilteringTextInputFormatter.deny(
    RegExpUtils.ellipsisUnicode,
    replacementString: '...',
  );

  static final TextInputFormatterInterface lowerCase = FunctionTextInputFormatterInterface(
    (oldValue, newValue) => newValue.copyWith(text: newValue.text.toLowerCase()),
    influenceAction: InfluenceAction.replaced,
  );

  static final List<TextInputFormatterInterface> username = [
    lowerCase,
    FilteringTextInputFormatterInterface.allow(
      RegExpUtils.usernameSymbol,
      influenceAction: InfluenceAction.denied,
    ),
  ];

  static final TextInputFormatterInterface digitsOnly = FilteringTextInputFormatterInterface.allow(
    RegExpUtils.digitsOnlySymbol,
    influenceAction: InfluenceAction.denied,
  );

  const Formatters._();
}