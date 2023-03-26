// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_card_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduCardTheme {
  ColorSchemeReference get backgroundColor =>
      throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;
  ColorSchemeReference get borderColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduCardThemeCopyWith<EduCardTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduCardThemeCopyWith<$Res> {
  factory $EduCardThemeCopyWith(
          EduCardTheme value, $Res Function(EduCardTheme) then) =
      _$EduCardThemeCopyWithImpl<$Res, EduCardTheme>;
  @useResult
  $Res call(
      {ColorSchemeReference backgroundColor,
      double borderRadius,
      ColorSchemeReference borderColor});
}

/// @nodoc
class _$EduCardThemeCopyWithImpl<$Res, $Val extends EduCardTheme>
    implements $EduCardThemeCopyWith<$Res> {
  _$EduCardThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? borderRadius = null,
    Object? borderColor = null,
  }) {
    return _then(_value.copyWith(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      borderColor: null == borderColor
          ? _value.borderColor
          : borderColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduCardThemeCopyWith<$Res>
    implements $EduCardThemeCopyWith<$Res> {
  factory _$$_EduCardThemeCopyWith(
          _$_EduCardTheme value, $Res Function(_$_EduCardTheme) then) =
      __$$_EduCardThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ColorSchemeReference backgroundColor,
      double borderRadius,
      ColorSchemeReference borderColor});
}

/// @nodoc
class __$$_EduCardThemeCopyWithImpl<$Res>
    extends _$EduCardThemeCopyWithImpl<$Res, _$_EduCardTheme>
    implements _$$_EduCardThemeCopyWith<$Res> {
  __$$_EduCardThemeCopyWithImpl(
      _$_EduCardTheme _value, $Res Function(_$_EduCardTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? borderRadius = null,
    Object? borderColor = null,
  }) {
    return _then(_$_EduCardTheme(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      borderColor: null == borderColor
          ? _value.borderColor
          : borderColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ));
  }
}

/// @nodoc

class _$_EduCardTheme implements _EduCardTheme {
  const _$_EduCardTheme(
      {required this.backgroundColor,
      required this.borderRadius,
      required this.borderColor});

  @override
  final ColorSchemeReference backgroundColor;
  @override
  final double borderRadius;
  @override
  final ColorSchemeReference borderColor;

  @override
  String toString() {
    return 'EduCardTheme(backgroundColor: $backgroundColor, borderRadius: $borderRadius, borderColor: $borderColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduCardTheme &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, backgroundColor, borderRadius, borderColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduCardThemeCopyWith<_$_EduCardTheme> get copyWith =>
      __$$_EduCardThemeCopyWithImpl<_$_EduCardTheme>(this, _$identity);
}

abstract class _EduCardTheme implements EduCardTheme {
  const factory _EduCardTheme(
      {required final ColorSchemeReference backgroundColor,
      required final double borderRadius,
      required final ColorSchemeReference borderColor}) = _$_EduCardTheme;

  @override
  ColorSchemeReference get backgroundColor;
  @override
  double get borderRadius;
  @override
  ColorSchemeReference get borderColor;
  @override
  @JsonKey(ignore: true)
  _$$_EduCardThemeCopyWith<_$_EduCardTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
