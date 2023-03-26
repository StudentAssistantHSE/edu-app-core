// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_text_button_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduTextButtonTheme {
  ColorSchemeReference get foregroundColor =>
      throw _privateConstructorUsedError;
  ColorSchemeReference get disabledForegroundColor =>
      throw _privateConstructorUsedError;
  TextThemeReference get textStyle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduTextButtonThemeCopyWith<EduTextButtonTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduTextButtonThemeCopyWith<$Res> {
  factory $EduTextButtonThemeCopyWith(
          EduTextButtonTheme value, $Res Function(EduTextButtonTheme) then) =
      _$EduTextButtonThemeCopyWithImpl<$Res, EduTextButtonTheme>;
  @useResult
  $Res call(
      {ColorSchemeReference foregroundColor,
      ColorSchemeReference disabledForegroundColor,
      TextThemeReference textStyle});
}

/// @nodoc
class _$EduTextButtonThemeCopyWithImpl<$Res, $Val extends EduTextButtonTheme>
    implements $EduTextButtonThemeCopyWith<$Res> {
  _$EduTextButtonThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foregroundColor = null,
    Object? disabledForegroundColor = null,
    Object? textStyle = null,
  }) {
    return _then(_value.copyWith(
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      disabledForegroundColor: null == disabledForegroundColor
          ? _value.disabledForegroundColor
          : disabledForegroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      textStyle: null == textStyle
          ? _value.textStyle
          : textStyle // ignore: cast_nullable_to_non_nullable
              as TextThemeReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduTextButtonThemeCopyWith<$Res>
    implements $EduTextButtonThemeCopyWith<$Res> {
  factory _$$_EduTextButtonThemeCopyWith(_$_EduTextButtonTheme value,
          $Res Function(_$_EduTextButtonTheme) then) =
      __$$_EduTextButtonThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ColorSchemeReference foregroundColor,
      ColorSchemeReference disabledForegroundColor,
      TextThemeReference textStyle});
}

/// @nodoc
class __$$_EduTextButtonThemeCopyWithImpl<$Res>
    extends _$EduTextButtonThemeCopyWithImpl<$Res, _$_EduTextButtonTheme>
    implements _$$_EduTextButtonThemeCopyWith<$Res> {
  __$$_EduTextButtonThemeCopyWithImpl(
      _$_EduTextButtonTheme _value, $Res Function(_$_EduTextButtonTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foregroundColor = null,
    Object? disabledForegroundColor = null,
    Object? textStyle = null,
  }) {
    return _then(_$_EduTextButtonTheme(
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      disabledForegroundColor: null == disabledForegroundColor
          ? _value.disabledForegroundColor
          : disabledForegroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      textStyle: null == textStyle
          ? _value.textStyle
          : textStyle // ignore: cast_nullable_to_non_nullable
              as TextThemeReference,
    ));
  }
}

/// @nodoc

class _$_EduTextButtonTheme implements _EduTextButtonTheme {
  const _$_EduTextButtonTheme(
      {required this.foregroundColor,
      required this.disabledForegroundColor,
      required this.textStyle});

  @override
  final ColorSchemeReference foregroundColor;
  @override
  final ColorSchemeReference disabledForegroundColor;
  @override
  final TextThemeReference textStyle;

  @override
  String toString() {
    return 'EduTextButtonTheme(foregroundColor: $foregroundColor, disabledForegroundColor: $disabledForegroundColor, textStyle: $textStyle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduTextButtonTheme &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor) &&
            (identical(
                    other.disabledForegroundColor, disabledForegroundColor) ||
                other.disabledForegroundColor == disabledForegroundColor) &&
            (identical(other.textStyle, textStyle) ||
                other.textStyle == textStyle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, foregroundColor, disabledForegroundColor, textStyle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduTextButtonThemeCopyWith<_$_EduTextButtonTheme> get copyWith =>
      __$$_EduTextButtonThemeCopyWithImpl<_$_EduTextButtonTheme>(
          this, _$identity);
}

abstract class _EduTextButtonTheme implements EduTextButtonTheme {
  const factory _EduTextButtonTheme(
      {required final ColorSchemeReference foregroundColor,
      required final ColorSchemeReference disabledForegroundColor,
      required final TextThemeReference textStyle}) = _$_EduTextButtonTheme;

  @override
  ColorSchemeReference get foregroundColor;
  @override
  ColorSchemeReference get disabledForegroundColor;
  @override
  TextThemeReference get textStyle;
  @override
  @JsonKey(ignore: true)
  _$$_EduTextButtonThemeCopyWith<_$_EduTextButtonTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
