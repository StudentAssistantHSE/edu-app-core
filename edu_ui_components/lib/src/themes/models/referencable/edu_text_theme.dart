import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_text_theme.freezed.dart';

@freezed
class EduTextTheme with _$EduTextTheme {
  const factory EduTextTheme({
    required TextStyle headline,
    required TextStyle pageTitle,
    required TextStyle title,
    required TextStyle body,
    required TextStyle caption,
  }) = _EduTextTheme;

  factory EduTextTheme.lerp(EduTextTheme before, EduTextTheme after, double t) =>
      EduTextTheme(
        headline: TextStyle.lerp(before.headline, after.headline, t) ?? after.headline,
        pageTitle: TextStyle.lerp(before.pageTitle, after.pageTitle, t) ?? after.pageTitle,
        title: TextStyle.lerp(before.title, after.title, t) ?? after.title,
        body: TextStyle.lerp(before.body, after.body, t) ?? after.body,
        caption: TextStyle.lerp(before.caption, after.caption, t) ?? after.caption,
      );
}

enum TextThemeReference {
  headline,
  pageTitle,
  title,
  body,
  caption,
}

extension TextThemeReferenceResolver on TextThemeReference {
  TextStyle resolveTextTheme(EduTextTheme textTheme) {
    switch (this) {
      case TextThemeReference.headline:
        return textTheme.headline;
      case TextThemeReference.pageTitle:
        return textTheme.pageTitle;
      case TextThemeReference.title:
        return textTheme.title;
      case TextThemeReference.body:
        return textTheme.body;
      case TextThemeReference.caption:
        return textTheme.caption;
    }
  }
}