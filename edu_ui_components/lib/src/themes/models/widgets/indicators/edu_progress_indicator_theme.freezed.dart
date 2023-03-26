// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_progress_indicator_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduProgressIndicatorTheme {
  ColorSchemeReference get color => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduProgressIndicatorThemeCopyWith<EduProgressIndicatorTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduProgressIndicatorThemeCopyWith<$Res> {
  factory $EduProgressIndicatorThemeCopyWith(EduProgressIndicatorTheme value,
          $Res Function(EduProgressIndicatorTheme) then) =
      _$EduProgressIndicatorThemeCopyWithImpl<$Res, EduProgressIndicatorTheme>;
  @useResult
  $Res call({ColorSchemeReference color, double width});
}

/// @nodoc
class _$EduProgressIndicatorThemeCopyWithImpl<$Res,
        $Val extends EduProgressIndicatorTheme>
    implements $EduProgressIndicatorThemeCopyWith<$Res> {
  _$EduProgressIndicatorThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? width = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduProgressIndicatorThemeCopyWith<$Res>
    implements $EduProgressIndicatorThemeCopyWith<$Res> {
  factory _$$_EduProgressIndicatorThemeCopyWith(
          _$_EduProgressIndicatorTheme value,
          $Res Function(_$_EduProgressIndicatorTheme) then) =
      __$$_EduProgressIndicatorThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ColorSchemeReference color, double width});
}

/// @nodoc
class __$$_EduProgressIndicatorThemeCopyWithImpl<$Res>
    extends _$EduProgressIndicatorThemeCopyWithImpl<$Res,
        _$_EduProgressIndicatorTheme>
    implements _$$_EduProgressIndicatorThemeCopyWith<$Res> {
  __$$_EduProgressIndicatorThemeCopyWithImpl(
      _$_EduProgressIndicatorTheme _value,
      $Res Function(_$_EduProgressIndicatorTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? width = null,
  }) {
    return _then(_$_EduProgressIndicatorTheme(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_EduProgressIndicatorTheme implements _EduProgressIndicatorTheme {
  const _$_EduProgressIndicatorTheme(
      {required this.color, required this.width});

  @override
  final ColorSchemeReference color;
  @override
  final double width;

  @override
  String toString() {
    return 'EduProgressIndicatorTheme(color: $color, width: $width)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduProgressIndicatorTheme &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.width, width) || other.width == width));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, width);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduProgressIndicatorThemeCopyWith<_$_EduProgressIndicatorTheme>
      get copyWith => __$$_EduProgressIndicatorThemeCopyWithImpl<
          _$_EduProgressIndicatorTheme>(this, _$identity);
}

abstract class _EduProgressIndicatorTheme implements EduProgressIndicatorTheme {
  const factory _EduProgressIndicatorTheme(
      {required final ColorSchemeReference color,
      required final double width}) = _$_EduProgressIndicatorTheme;

  @override
  ColorSchemeReference get color;
  @override
  double get width;
  @override
  @JsonKey(ignore: true)
  _$$_EduProgressIndicatorThemeCopyWith<_$_EduProgressIndicatorTheme>
      get copyWith => throw _privateConstructorUsedError;
}
