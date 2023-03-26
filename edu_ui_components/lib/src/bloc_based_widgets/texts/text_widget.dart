import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_ui_components/src/bloc_based_widgets/texts/text_controller.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextWidget extends StatelessWidget {
  final TextThemeReference textStyle;
  final TextController controller;
  final ColorSchemeReference? color;
  final TextAlign? textAlign;
  final bool? softWrap;

  const TextWidget({
    required this.textStyle,
    required this.controller,
    this.color,
    this.textAlign,
    this.softWrap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = context.select<S, String?>(controller.textSelector);
    if (text == null) {
      return const SizedBox.shrink();
    }
    final theme = EduTheme.of(context);
    return Text(
      text,
      style: textStyle.resolveTextTheme(theme.textTheme).copyWith(
        color: color?.resolveColorScheme(theme.colorScheme),
      ),
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}