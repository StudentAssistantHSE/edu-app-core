// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_shadows_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduShadowsTheme {
  List<BoxShadow> get upShadow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduShadowsThemeCopyWith<EduShadowsTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduShadowsThemeCopyWith<$Res> {
  factory $EduShadowsThemeCopyWith(
          EduShadowsTheme value, $Res Function(EduShadowsTheme) then) =
      _$EduShadowsThemeCopyWithImpl<$Res, EduShadowsTheme>;
  @useResult
  $Res call({List<BoxShadow> upShadow});
}

/// @nodoc
class _$EduShadowsThemeCopyWithImpl<$Res, $Val extends EduShadowsTheme>
    implements $EduShadowsThemeCopyWith<$Res> {
  _$EduShadowsThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upShadow = null,
  }) {
    return _then(_value.copyWith(
      upShadow: null == upShadow
          ? _value.upShadow
          : upShadow // ignore: cast_nullable_to_non_nullable
              as List<BoxShadow>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduShadowsThemeCopyWith<$Res>
    implements $EduShadowsThemeCopyWith<$Res> {
  factory _$$_EduShadowsThemeCopyWith(
          _$_EduShadowsTheme value, $Res Function(_$_EduShadowsTheme) then) =
      __$$_EduShadowsThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BoxShadow> upShadow});
}

/// @nodoc
class __$$_EduShadowsThemeCopyWithImpl<$Res>
    extends _$EduShadowsThemeCopyWithImpl<$Res, _$_EduShadowsTheme>
    implements _$$_EduShadowsThemeCopyWith<$Res> {
  __$$_EduShadowsThemeCopyWithImpl(
      _$_EduShadowsTheme _value, $Res Function(_$_EduShadowsTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upShadow = null,
  }) {
    return _then(_$_EduShadowsTheme(
      upShadow: null == upShadow
          ? _value._upShadow
          : upShadow // ignore: cast_nullable_to_non_nullable
              as List<BoxShadow>,
    ));
  }
}

/// @nodoc

class _$_EduShadowsTheme implements _EduShadowsTheme {
  const _$_EduShadowsTheme({required final List<BoxShadow> upShadow})
      : _upShadow = upShadow;

  final List<BoxShadow> _upShadow;
  @override
  List<BoxShadow> get upShadow {
    if (_upShadow is EqualUnmodifiableListView) return _upShadow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upShadow);
  }

  @override
  String toString() {
    return 'EduShadowsTheme(upShadow: $upShadow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduShadowsTheme &&
            const DeepCollectionEquality().equals(other._upShadow, _upShadow));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_upShadow));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduShadowsThemeCopyWith<_$_EduShadowsTheme> get copyWith =>
      __$$_EduShadowsThemeCopyWithImpl<_$_EduShadowsTheme>(this, _$identity);
}

abstract class _EduShadowsTheme implements EduShadowsTheme {
  const factory _EduShadowsTheme({required final List<BoxShadow> upShadow}) =
      _$_EduShadowsTheme;

  @override
  List<BoxShadow> get upShadow;
  @override
  @JsonKey(ignore: true)
  _$$_EduShadowsThemeCopyWith<_$_EduShadowsTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
