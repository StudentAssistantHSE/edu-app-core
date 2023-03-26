// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_gradients_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduGradientsTheme {
  Gradient get primary => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduGradientsThemeCopyWith<EduGradientsTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduGradientsThemeCopyWith<$Res> {
  factory $EduGradientsThemeCopyWith(
          EduGradientsTheme value, $Res Function(EduGradientsTheme) then) =
      _$EduGradientsThemeCopyWithImpl<$Res, EduGradientsTheme>;
  @useResult
  $Res call({Gradient primary});
}

/// @nodoc
class _$EduGradientsThemeCopyWithImpl<$Res, $Val extends EduGradientsTheme>
    implements $EduGradientsThemeCopyWith<$Res> {
  _$EduGradientsThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
  }) {
    return _then(_value.copyWith(
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as Gradient,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduGradientsThemeCopyWith<$Res>
    implements $EduGradientsThemeCopyWith<$Res> {
  factory _$$_EduGradientsThemeCopyWith(_$_EduGradientsTheme value,
          $Res Function(_$_EduGradientsTheme) then) =
      __$$_EduGradientsThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Gradient primary});
}

/// @nodoc
class __$$_EduGradientsThemeCopyWithImpl<$Res>
    extends _$EduGradientsThemeCopyWithImpl<$Res, _$_EduGradientsTheme>
    implements _$$_EduGradientsThemeCopyWith<$Res> {
  __$$_EduGradientsThemeCopyWithImpl(
      _$_EduGradientsTheme _value, $Res Function(_$_EduGradientsTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
  }) {
    return _then(_$_EduGradientsTheme(
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as Gradient,
    ));
  }
}

/// @nodoc

class _$_EduGradientsTheme implements _EduGradientsTheme {
  const _$_EduGradientsTheme({required this.primary});

  @override
  final Gradient primary;

  @override
  String toString() {
    return 'EduGradientsTheme(primary: $primary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduGradientsTheme &&
            (identical(other.primary, primary) || other.primary == primary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, primary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduGradientsThemeCopyWith<_$_EduGradientsTheme> get copyWith =>
      __$$_EduGradientsThemeCopyWithImpl<_$_EduGradientsTheme>(
          this, _$identity);
}

abstract class _EduGradientsTheme implements EduGradientsTheme {
  const factory _EduGradientsTheme({required final Gradient primary}) =
      _$_EduGradientsTheme;

  @override
  Gradient get primary;
  @override
  @JsonKey(ignore: true)
  _$$_EduGradientsThemeCopyWith<_$_EduGradientsTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
