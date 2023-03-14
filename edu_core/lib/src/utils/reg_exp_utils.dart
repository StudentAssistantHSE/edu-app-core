abstract class RegExpUtils {
  static final ellipsisUnicode = RegExp('\u2026');

  static final emailString = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  static final usernameSymbol = RegExp('[a-z0-9_.]');
  static final usernameString = RegExp(r'^[a-z0-9._]*$');

  static final passwordString = RegExp(r'^(?=.*[a-z])+(?=.*[A-Z])+(?=.*\d)+.{8,128}$');

  static final digitsOnlySymbol = RegExp('[0-9]');
  static final digitsOnlyString = RegExp(r'^[0-9]*$');

  static final anyLowercaseLatinLetter = RegExp('[a-z]');
  static final anyUppercaseLatinLetter = RegExp('[A-Z]');
  static final anyDigit = RegExp('[0-9]');

  const RegExpUtils._();
}