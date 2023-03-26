// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_image_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduImageTheme {
  ColorSchemeReference get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduImageThemeCopyWith<EduImageTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduImageThemeCopyWith<$Res> {
  factory $EduImageThemeCopyWith(
          EduImageTheme value, $Res Function(EduImageTheme) then) =
      _$EduImageThemeCopyWithImpl<$Res, EduImageTheme>;
  @useResult
  $Res call({ColorSchemeReference color});
}

/// @nodoc
class _$EduImageThemeCopyWithImpl<$Res, $Val extends EduImageTheme>
    implements $EduImageThemeCopyWith<$Res> {
  _$EduImageThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduImageThemeCopyWith<$Res>
    implements $EduImageThemeCopyWith<$Res> {
  factory _$$_EduImageThemeCopyWith(
          _$_EduImageTheme value, $Res Function(_$_EduImageTheme) then) =
      __$$_EduImageThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ColorSchemeReference color});
}

/// @nodoc
class __$$_EduImageThemeCopyWithImpl<$Res>
    extends _$EduImageThemeCopyWithImpl<$Res, _$_EduImageTheme>
    implements _$$_EduImageThemeCopyWith<$Res> {
  __$$_EduImageThemeCopyWithImpl(
      _$_EduImageTheme _value, $Res Function(_$_EduImageTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$_EduImageTheme(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ));
  }
}

/// @nodoc

class _$_EduImageTheme implements _EduImageTheme {
  const _$_EduImageTheme({required this.color});

  @override
  final ColorSchemeReference color;

  @override
  String toString() {
    return 'EduImageTheme(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduImageTheme &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduImageThemeCopyWith<_$_EduImageTheme> get copyWith =>
      __$$_EduImageThemeCopyWithImpl<_$_EduImageTheme>(this, _$identity);
}

abstract class _EduImageTheme implements EduImageTheme {
  const factory _EduImageTheme({required final ColorSchemeReference color}) =
      _$_EduImageTheme;

  @override
  ColorSchemeReference get color;
  @override
  @JsonKey(ignore: true)
  _$$_EduImageThemeCopyWith<_$_EduImageTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
