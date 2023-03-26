// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_indicator_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadingIndicatorTheme {
  ColorSchemeReference get color => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  double get iconSize => throw _privateConstructorUsedError;
  double get dotsSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadingIndicatorThemeCopyWith<LoadingIndicatorTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingIndicatorThemeCopyWith<$Res> {
  factory $LoadingIndicatorThemeCopyWith(LoadingIndicatorTheme value,
          $Res Function(LoadingIndicatorTheme) then) =
      _$LoadingIndicatorThemeCopyWithImpl<$Res, LoadingIndicatorTheme>;
  @useResult
  $Res call(
      {ColorSchemeReference color,
      Duration duration,
      double iconSize,
      double dotsSize});
}

/// @nodoc
class _$LoadingIndicatorThemeCopyWithImpl<$Res,
        $Val extends LoadingIndicatorTheme>
    implements $LoadingIndicatorThemeCopyWith<$Res> {
  _$LoadingIndicatorThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? duration = null,
    Object? iconSize = null,
    Object? dotsSize = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      iconSize: null == iconSize
          ? _value.iconSize
          : iconSize // ignore: cast_nullable_to_non_nullable
              as double,
      dotsSize: null == dotsSize
          ? _value.dotsSize
          : dotsSize // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoadingIndicatorThemeCopyWith<$Res>
    implements $LoadingIndicatorThemeCopyWith<$Res> {
  factory _$$_LoadingIndicatorThemeCopyWith(_$_LoadingIndicatorTheme value,
          $Res Function(_$_LoadingIndicatorTheme) then) =
      __$$_LoadingIndicatorThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ColorSchemeReference color,
      Duration duration,
      double iconSize,
      double dotsSize});
}

/// @nodoc
class __$$_LoadingIndicatorThemeCopyWithImpl<$Res>
    extends _$LoadingIndicatorThemeCopyWithImpl<$Res, _$_LoadingIndicatorTheme>
    implements _$$_LoadingIndicatorThemeCopyWith<$Res> {
  __$$_LoadingIndicatorThemeCopyWithImpl(_$_LoadingIndicatorTheme _value,
      $Res Function(_$_LoadingIndicatorTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? duration = null,
    Object? iconSize = null,
    Object? dotsSize = null,
  }) {
    return _then(_$_LoadingIndicatorTheme(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSchemeReference,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      iconSize: null == iconSize
          ? _value.iconSize
          : iconSize // ignore: cast_nullable_to_non_nullable
              as double,
      dotsSize: null == dotsSize
          ? _value.dotsSize
          : dotsSize // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_LoadingIndicatorTheme
    with DiagnosticableTreeMixin
    implements _LoadingIndicatorTheme {
  const _$_LoadingIndicatorTheme(
      {required this.color,
      required this.duration,
      required this.iconSize,
      required this.dotsSize});

  @override
  final ColorSchemeReference color;
  @override
  final Duration duration;
  @override
  final double iconSize;
  @override
  final double dotsSize;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadingIndicatorTheme(color: $color, duration: $duration, iconSize: $iconSize, dotsSize: $dotsSize)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoadingIndicatorTheme'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('iconSize', iconSize))
      ..add(DiagnosticsProperty('dotsSize', dotsSize));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingIndicatorTheme &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.iconSize, iconSize) ||
                other.iconSize == iconSize) &&
            (identical(other.dotsSize, dotsSize) ||
                other.dotsSize == dotsSize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, color, duration, iconSize, dotsSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingIndicatorThemeCopyWith<_$_LoadingIndicatorTheme> get copyWith =>
      __$$_LoadingIndicatorThemeCopyWithImpl<_$_LoadingIndicatorTheme>(
          this, _$identity);
}

abstract class _LoadingIndicatorTheme implements LoadingIndicatorTheme {
  const factory _LoadingIndicatorTheme(
      {required final ColorSchemeReference color,
      required final Duration duration,
      required final double iconSize,
      required final double dotsSize}) = _$_LoadingIndicatorTheme;

  @override
  ColorSchemeReference get color;
  @override
  Duration get duration;
  @override
  double get iconSize;
  @override
  double get dotsSize;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingIndicatorThemeCopyWith<_$_LoadingIndicatorTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
