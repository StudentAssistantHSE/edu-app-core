// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_opacity_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduOpacityTheme {
  double get visible => throw _privateConstructorUsedError;
  double get disabled => throw _privateConstructorUsedError;
  double get invisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduOpacityThemeCopyWith<EduOpacityTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduOpacityThemeCopyWith<$Res> {
  factory $EduOpacityThemeCopyWith(
          EduOpacityTheme value, $Res Function(EduOpacityTheme) then) =
      _$EduOpacityThemeCopyWithImpl<$Res, EduOpacityTheme>;
  @useResult
  $Res call({double visible, double disabled, double invisible});
}

/// @nodoc
class _$EduOpacityThemeCopyWithImpl<$Res, $Val extends EduOpacityTheme>
    implements $EduOpacityThemeCopyWith<$Res> {
  _$EduOpacityThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visible = null,
    Object? disabled = null,
    Object? invisible = null,
  }) {
    return _then(_value.copyWith(
      visible: null == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as double,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as double,
      invisible: null == invisible
          ? _value.invisible
          : invisible // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduOpacityThemeCopyWith<$Res>
    implements $EduOpacityThemeCopyWith<$Res> {
  factory _$$_EduOpacityThemeCopyWith(
          _$_EduOpacityTheme value, $Res Function(_$_EduOpacityTheme) then) =
      __$$_EduOpacityThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double visible, double disabled, double invisible});
}

/// @nodoc
class __$$_EduOpacityThemeCopyWithImpl<$Res>
    extends _$EduOpacityThemeCopyWithImpl<$Res, _$_EduOpacityTheme>
    implements _$$_EduOpacityThemeCopyWith<$Res> {
  __$$_EduOpacityThemeCopyWithImpl(
      _$_EduOpacityTheme _value, $Res Function(_$_EduOpacityTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visible = null,
    Object? disabled = null,
    Object? invisible = null,
  }) {
    return _then(_$_EduOpacityTheme(
      visible: null == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as double,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as double,
      invisible: null == invisible
          ? _value.invisible
          : invisible // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_EduOpacityTheme implements _EduOpacityTheme {
  const _$_EduOpacityTheme(
      {required this.visible, required this.disabled, required this.invisible});

  @override
  final double visible;
  @override
  final double disabled;
  @override
  final double invisible;

  @override
  String toString() {
    return 'EduOpacityTheme(visible: $visible, disabled: $disabled, invisible: $invisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduOpacityTheme &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.invisible, invisible) ||
                other.invisible == invisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, visible, disabled, invisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduOpacityThemeCopyWith<_$_EduOpacityTheme> get copyWith =>
      __$$_EduOpacityThemeCopyWithImpl<_$_EduOpacityTheme>(this, _$identity);
}

abstract class _EduOpacityTheme implements EduOpacityTheme {
  const factory _EduOpacityTheme(
      {required final double visible,
      required final double disabled,
      required final double invisible}) = _$_EduOpacityTheme;

  @override
  double get visible;
  @override
  double get disabled;
  @override
  double get invisible;
  @override
  @JsonKey(ignore: true)
  _$$_EduOpacityThemeCopyWith<_$_EduOpacityTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
