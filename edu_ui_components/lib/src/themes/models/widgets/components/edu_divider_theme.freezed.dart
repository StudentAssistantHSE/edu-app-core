// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_divider_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduDividerTheme {
  double get height => throw _privateConstructorUsedError;
  ColorSchemeReference get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduDividerThemeCopyWith<EduDividerTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduDividerThemeCopyWith<$Res> {
  factory $EduDividerThemeCopyWith(
          EduDividerTheme value, $Res Function(EduDividerTheme) then) =
      _$EduDividerThemeCopyWithImpl<$Res, EduDividerTheme>;
  @useResult
  $Res call({double height, ColorSchemeReference color});
}

/// @nodoc
class _$EduDividerThemeCopyWithImpl<$Res, $Val extends EduDividerTheme>
    implements $EduDividerThemeCopyWith<$Res> {
  _$EduDividerThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduDividerThemeCopyWith<$Res>
    implements $EduDividerThemeCopyWith<$Res> {
  factory _$$_EduDividerThemeCopyWith(
          _$_EduDividerTheme value, $Res Function(_$_EduDividerTheme) then) =
      __$$_EduDividerThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double height, ColorSchemeReference color});
}

/// @nodoc
class __$$_EduDividerThemeCopyWithImpl<$Res>
    extends _$EduDividerThemeCopyWithImpl<$Res, _$_EduDividerTheme>
    implements _$$_EduDividerThemeCopyWith<$Res> {
  __$$_EduDividerThemeCopyWithImpl(
      _$_EduDividerTheme _value, $Res Function(_$_EduDividerTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? color = null,
  }) {
    return _then(_$_EduDividerTheme(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ));
  }
}

/// @nodoc

class _$_EduDividerTheme implements _EduDividerTheme {
  const _$_EduDividerTheme({required this.height, required this.color});

  @override
  final double height;
  @override
  final ColorSchemeReference color;

  @override
  String toString() {
    return 'EduDividerTheme(height: $height, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduDividerTheme &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, height, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduDividerThemeCopyWith<_$_EduDividerTheme> get copyWith =>
      __$$_EduDividerThemeCopyWithImpl<_$_EduDividerTheme>(this, _$identity);
}

abstract class _EduDividerTheme implements EduDividerTheme {
  const factory _EduDividerTheme(
      {required final double height,
      required final ColorSchemeReference color}) = _$_EduDividerTheme;

  @override
  double get height;
  @override
  ColorSchemeReference get color;
  @override
  @JsonKey(ignore: true)
  _$$_EduDividerThemeCopyWith<_$_EduDividerTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
