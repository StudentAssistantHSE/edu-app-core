// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_shimmer_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadingShimmerTheme {
  Duration get duration => throw _privateConstructorUsedError;
  ColorSchemeReference get baseColor => throw _privateConstructorUsedError;
  ColorSchemeReference get highlightColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadingShimmerThemeCopyWith<LoadingShimmerTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingShimmerThemeCopyWith<$Res> {
  factory $LoadingShimmerThemeCopyWith(
          LoadingShimmerTheme value, $Res Function(LoadingShimmerTheme) then) =
      _$LoadingShimmerThemeCopyWithImpl<$Res, LoadingShimmerTheme>;
  @useResult
  $Res call(
      {Duration duration,
      ColorSchemeReference baseColor,
      ColorSchemeReference highlightColor});
}

/// @nodoc
class _$LoadingShimmerThemeCopyWithImpl<$Res, $Val extends LoadingShimmerTheme>
    implements $LoadingShimmerThemeCopyWith<$Res> {
  _$LoadingShimmerThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? baseColor = null,
    Object? highlightColor = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      baseColor: null == baseColor
          ? _value.baseColor
          : baseColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      highlightColor: null == highlightColor
          ? _value.highlightColor
          : highlightColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoadingShimmerThemeCopyWith<$Res>
    implements $LoadingShimmerThemeCopyWith<$Res> {
  factory _$$_LoadingShimmerThemeCopyWith(_$_LoadingShimmerTheme value,
          $Res Function(_$_LoadingShimmerTheme) then) =
      __$$_LoadingShimmerThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration duration,
      ColorSchemeReference baseColor,
      ColorSchemeReference highlightColor});
}

/// @nodoc
class __$$_LoadingShimmerThemeCopyWithImpl<$Res>
    extends _$LoadingShimmerThemeCopyWithImpl<$Res, _$_LoadingShimmerTheme>
    implements _$$_LoadingShimmerThemeCopyWith<$Res> {
  __$$_LoadingShimmerThemeCopyWithImpl(_$_LoadingShimmerTheme _value,
      $Res Function(_$_LoadingShimmerTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? baseColor = null,
    Object? highlightColor = null,
  }) {
    return _then(_$_LoadingShimmerTheme(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      baseColor: null == baseColor
          ? _value.baseColor
          : baseColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      highlightColor: null == highlightColor
          ? _value.highlightColor
          : highlightColor // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
    ));
  }
}

/// @nodoc

class _$_LoadingShimmerTheme
    with DiagnosticableTreeMixin
    implements _LoadingShimmerTheme {
  const _$_LoadingShimmerTheme(
      {required this.duration,
      required this.baseColor,
      required this.highlightColor});

  @override
  final Duration duration;
  @override
  final ColorSchemeReference baseColor;
  @override
  final ColorSchemeReference highlightColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadingShimmerTheme(duration: $duration, baseColor: $baseColor, highlightColor: $highlightColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoadingShimmerTheme'))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('baseColor', baseColor))
      ..add(DiagnosticsProperty('highlightColor', highlightColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingShimmerTheme &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.baseColor, baseColor) ||
                other.baseColor == baseColor) &&
            (identical(other.highlightColor, highlightColor) ||
                other.highlightColor == highlightColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, duration, baseColor, highlightColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingShimmerThemeCopyWith<_$_LoadingShimmerTheme> get copyWith =>
      __$$_LoadingShimmerThemeCopyWithImpl<_$_LoadingShimmerTheme>(
          this, _$identity);
}

abstract class _LoadingShimmerTheme implements LoadingShimmerTheme {
  const factory _LoadingShimmerTheme(
          {required final Duration duration,
          required final ColorSchemeReference baseColor,
          required final ColorSchemeReference highlightColor}) =
      _$_LoadingShimmerTheme;

  @override
  Duration get duration;
  @override
  ColorSchemeReference get baseColor;
  @override
  ColorSchemeReference get highlightColor;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingShimmerThemeCopyWith<_$_LoadingShimmerTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
