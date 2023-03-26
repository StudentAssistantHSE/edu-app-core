import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

class EduTheme extends StatelessWidget {
  final EduThemeData data;
  final Widget child;

  const EduTheme({ required this.data, required this.child, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => _InheritedTheme(
    theme: this,
    child: child,
  );

  static EduThemeData of(BuildContext context) {
    final inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return inheritedTheme?.theme.data ?? ThemeType.platform.themeData;
  }
}

class AnimatedEduTheme extends ImplicitlyAnimatedWidget {
  final EduThemeData data;
  final Widget child;

  const AnimatedEduTheme({
    required this.data,
    required this.child,
    super.curve,
    super.duration = kThemeAnimationDuration,
    super.onEnd,
    super.key,
  });

  @override
  _AnimatedEduThemeState createState() => _AnimatedEduThemeState();
}

class _AnimatedEduThemeState extends AnimatedWidgetBaseState<AnimatedEduTheme> {
  _EduThemeDataTween? _data;

  @override
  void forEachTween(TweenVisitor<Object?> visitor) {
    _data = visitor(
      _data,
      widget.data,
      (value) => _EduThemeDataTween(begin: value as EduThemeData),
    )! as _EduThemeDataTween;
  }

  @override
  Widget build(BuildContext context) {
    return EduTheme(
      data: _data!.evaluate(animation),
      child: widget.child,
    );
  }
}

class _EduThemeDataTween extends Tween<EduThemeData> {
  _EduThemeDataTween({ EduThemeData? begin, EduThemeData? end }) : super(begin: begin, end: end);

  @override
  EduThemeData lerp(double t) => EduThemeData.lerp(begin!, end!, t);
}

class _InheritedTheme extends InheritedTheme {
  final EduTheme theme;

  const _InheritedTheme({
    required this.theme,
    required super.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget wrap(BuildContext context, Widget child) {
    return EduTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}