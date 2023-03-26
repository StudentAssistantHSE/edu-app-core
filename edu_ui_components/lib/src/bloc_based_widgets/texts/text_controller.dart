import 'package:edu_localizations/edu_localizations.dart';

abstract class TextController {
  const TextController();

  String? textSelector(S translations);
}