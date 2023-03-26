// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_scaffold_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduScaffoldTheme {
  ColorSchemeReference get backgroundColor =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduScaffoldThemeCopyWith<EduScaffoldTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduScaffoldThemeCopyWith<$Res> {
  factory $EduScaffoldThemeCopyWith(
          EduScaffoldTheme value, $Res Function(EduScaffoldTheme) then) =
      _$EduScaffoldThemeCopyWithImpl<$Res, EduScaffoldTheme>;
  @useResult
  $Res call({ColorSchemeReference backgroundColor});
}

/// @nodoc
class _$EduScaffoldThemeCopyWithImpl<$Res, $Val extends EduScaffoldTheme>
    implements $EduScaffoldThemeCopyWith<$Res> {
  _$EduScaffoldThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
  }) {
    return _then(_value.copyWith(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduScaffoldThemeCopyWith<$Res>
    implements $EduScaffoldThemeCopyWith<$Res> {
  factory _$$_EduScaffoldThemeCopyWith(
          _$_EduScaffoldTheme value, $Res Function(_$_EduScaffoldTheme) then) =
      __$$_EduScaffoldThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ColorSchemeReference backgroundColor});
}

/// @nodoc
class __$$_EduScaffoldThemeCopyWithImpl<$Res>
    extends _$EduScaffoldThemeCopyWithImpl<$Res, _$_EduScaffoldTheme>
    implements _$$_EduScaffoldThemeCopyWith<$Res> {
  __$$_EduScaffoldThemeCopyWithImpl(
      _$_EduScaffoldTheme _value, $Res Function(_$_EduScaffoldTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
  }) {
    return _then(_$_EduScaffoldTheme(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ));
  }
}

/// @nodoc

class _$_EduScaffoldTheme implements _EduScaffoldTheme {
  const _$_EduScaffoldTheme({required this.backgroundColor});

  @override
  final ColorSchemeReference backgroundColor;

  @override
  String toString() {
    return 'EduScaffoldTheme(backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduScaffoldTheme &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, backgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduScaffoldThemeCopyWith<_$_EduScaffoldTheme> get copyWith =>
      __$$_EduScaffoldThemeCopyWithImpl<_$_EduScaffoldTheme>(this, _$identity);
}

abstract class _EduScaffoldTheme implements EduScaffoldTheme {
  const factory _EduScaffoldTheme(
          {required final ColorSchemeReference backgroundColor}) =
      _$_EduScaffoldTheme;

  @override
  ColorSchemeReference get backgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_EduScaffoldThemeCopyWith<_$_EduScaffoldTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
