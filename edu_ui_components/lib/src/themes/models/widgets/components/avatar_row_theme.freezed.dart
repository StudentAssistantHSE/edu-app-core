// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_row_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AvatarRowTheme {
  double get avatarRadius => throw _privateConstructorUsedError;
  double get spacer => throw _privateConstructorUsedError;
  TextThemeReference get textStyle => throw _privateConstructorUsedError;
  ColorSchemeReference get foregroundColor =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvatarRowThemeCopyWith<AvatarRowTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarRowThemeCopyWith<$Res> {
  factory $AvatarRowThemeCopyWith(
          AvatarRowTheme value, $Res Function(AvatarRowTheme) then) =
      _$AvatarRowThemeCopyWithImpl<$Res, AvatarRowTheme>;
  @useResult
  $Res call(
      {double avatarRadius,
      double spacer,
      TextThemeReference textStyle,
      ColorSchemeReference foregroundColor});
}

/// @nodoc
class _$AvatarRowThemeCopyWithImpl<$Res, $Val extends AvatarRowTheme>
    implements $AvatarRowThemeCopyWith<$Res> {
  _$AvatarRowThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarRadius = null,
    Object? spacer = null,
    Object? textStyle = null,
    Object? foregroundColor = null,
  }) {
    return _then(_value.copyWith(
      avatarRadius: null == avatarRadius
          ? _value.avatarRadius
          : avatarRadius // ignore: cast_nullable_to_non_nullable
              as double,
      spacer: null == spacer
          ? _value.spacer
          : spacer // ignore: cast_nullable_to_non_nullable
              as double,
      textStyle: null == textStyle
          ? _value.textStyle
          : textStyle // ignore: cast_nullable_to_non_nullable
              as TextThemeReference,
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvatarRowThemeCopyWith<$Res>
    implements $AvatarRowThemeCopyWith<$Res> {
  factory _$$_AvatarRowThemeCopyWith(
          _$_AvatarRowTheme value, $Res Function(_$_AvatarRowTheme) then) =
      __$$_AvatarRowThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double avatarRadius,
      double spacer,
      TextThemeReference textStyle,
      ColorSchemeReference foregroundColor});
}

/// @nodoc
class __$$_AvatarRowThemeCopyWithImpl<$Res>
    extends _$AvatarRowThemeCopyWithImpl<$Res, _$_AvatarRowTheme>
    implements _$$_AvatarRowThemeCopyWith<$Res> {
  __$$_AvatarRowThemeCopyWithImpl(
      _$_AvatarRowTheme _value, $Res Function(_$_AvatarRowTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarRadius = null,
    Object? spacer = null,
    Object? textStyle = null,
    Object? foregroundColor = null,
  }) {
    return _then(_$_AvatarRowTheme(
      avatarRadius: null == avatarRadius
          ? _value.avatarRadius
          : avatarRadius // ignore: cast_nullable_to_non_nullable
              as double,
      spacer: null == spacer
          ? _value.spacer
          : spacer // ignore: cast_nullable_to_non_nullable
              as double,
      textStyle: null == textStyle
          ? _value.textStyle
          : textStyle // ignore: cast_nullable_to_non_nullable
              as TextThemeReference,
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ));
  }
}

/// @nodoc

class _$_AvatarRowTheme implements _AvatarRowTheme {
  const _$_AvatarRowTheme(
      {required this.avatarRadius,
      required this.spacer,
      required this.textStyle,
      required this.foregroundColor});

  @override
  final double avatarRadius;
  @override
  final double spacer;
  @override
  final TextThemeReference textStyle;
  @override
  final ColorSchemeReference foregroundColor;

  @override
  String toString() {
    return 'AvatarRowTheme(avatarRadius: $avatarRadius, spacer: $spacer, textStyle: $textStyle, foregroundColor: $foregroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvatarRowTheme &&
            (identical(other.avatarRadius, avatarRadius) ||
                other.avatarRadius == avatarRadius) &&
            (identical(other.spacer, spacer) || other.spacer == spacer) &&
            (identical(other.textStyle, textStyle) ||
                other.textStyle == textStyle) &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, avatarRadius, spacer, textStyle, foregroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvatarRowThemeCopyWith<_$_AvatarRowTheme> get copyWith =>
      __$$_AvatarRowThemeCopyWithImpl<_$_AvatarRowTheme>(this, _$identity);
}

abstract class _AvatarRowTheme implements AvatarRowTheme {
  const factory _AvatarRowTheme(
      {required final double avatarRadius,
      required final double spacer,
      required final TextThemeReference textStyle,
      required final ColorSchemeReference foregroundColor}) = _$_AvatarRowTheme;

  @override
  double get avatarRadius;
  @override
  double get spacer;
  @override
  TextThemeReference get textStyle;
  @override
  ColorSchemeReference get foregroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_AvatarRowThemeCopyWith<_$_AvatarRowTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
