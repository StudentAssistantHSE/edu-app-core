// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cross_fade_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CrossFadeTheme {
  TransitionsThemeReference get appearanceTransition =>
      throw _privateConstructorUsedError;
  TransitionsThemeReference get disappearanceTransition =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CrossFadeThemeCopyWith<CrossFadeTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrossFadeThemeCopyWith<$Res> {
  factory $CrossFadeThemeCopyWith(
          CrossFadeTheme value, $Res Function(CrossFadeTheme) then) =
      _$CrossFadeThemeCopyWithImpl<$Res, CrossFadeTheme>;
  @useResult
  $Res call(
      {TransitionsThemeReference appearanceTransition,
      TransitionsThemeReference disappearanceTransition});
}

/// @nodoc
class _$CrossFadeThemeCopyWithImpl<$Res, $Val extends CrossFadeTheme>
    implements $CrossFadeThemeCopyWith<$Res> {
  _$CrossFadeThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appearanceTransition = null,
    Object? disappearanceTransition = null,
  }) {
    return _then(_value.copyWith(
      appearanceTransition: null == appearanceTransition
          ? _value.appearanceTransition
          : appearanceTransition // ignore: cast_nullable_to_non_nullable
              as TransitionsThemeReference,
      disappearanceTransition: null == disappearanceTransition
          ? _value.disappearanceTransition
          : disappearanceTransition // ignore: cast_nullable_to_non_nullable
              as TransitionsThemeReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CrossFadeThemeCopyWith<$Res>
    implements $CrossFadeThemeCopyWith<$Res> {
  factory _$$_CrossFadeThemeCopyWith(
          _$_CrossFadeTheme value, $Res Function(_$_CrossFadeTheme) then) =
      __$$_CrossFadeThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransitionsThemeReference appearanceTransition,
      TransitionsThemeReference disappearanceTransition});
}

/// @nodoc
class __$$_CrossFadeThemeCopyWithImpl<$Res>
    extends _$CrossFadeThemeCopyWithImpl<$Res, _$_CrossFadeTheme>
    implements _$$_CrossFadeThemeCopyWith<$Res> {
  __$$_CrossFadeThemeCopyWithImpl(
      _$_CrossFadeTheme _value, $Res Function(_$_CrossFadeTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appearanceTransition = null,
    Object? disappearanceTransition = null,
  }) {
    return _then(_$_CrossFadeTheme(
      appearanceTransition: null == appearanceTransition
          ? _value.appearanceTransition
          : appearanceTransition // ignore: cast_nullable_to_non_nullable
              as TransitionsThemeReference,
      disappearanceTransition: null == disappearanceTransition
          ? _value.disappearanceTransition
          : disappearanceTransition // ignore: cast_nullable_to_non_nullable
              as TransitionsThemeReference,
    ));
  }
}

/// @nodoc

class _$_CrossFadeTheme implements _CrossFadeTheme {
  const _$_CrossFadeTheme(
      {required this.appearanceTransition,
      required this.disappearanceTransition});

  @override
  final TransitionsThemeReference appearanceTransition;
  @override
  final TransitionsThemeReference disappearanceTransition;

  @override
  String toString() {
    return 'CrossFadeTheme(appearanceTransition: $appearanceTransition, disappearanceTransition: $disappearanceTransition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CrossFadeTheme &&
            (identical(other.appearanceTransition, appearanceTransition) ||
                other.appearanceTransition == appearanceTransition) &&
            (identical(
                    other.disappearanceTransition, disappearanceTransition) ||
                other.disappearanceTransition == disappearanceTransition));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, appearanceTransition, disappearanceTransition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CrossFadeThemeCopyWith<_$_CrossFadeTheme> get copyWith =>
      __$$_CrossFadeThemeCopyWithImpl<_$_CrossFadeTheme>(this, _$identity);
}

abstract class _CrossFadeTheme implements CrossFadeTheme {
  const factory _CrossFadeTheme(
          {required final TransitionsThemeReference appearanceTransition,
          required final TransitionsThemeReference disappearanceTransition}) =
      _$_CrossFadeTheme;

  @override
  TransitionsThemeReference get appearanceTransition;
  @override
  TransitionsThemeReference get disappearanceTransition;
  @override
  @JsonKey(ignore: true)
  _$$_CrossFadeThemeCopyWith<_$_CrossFadeTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
