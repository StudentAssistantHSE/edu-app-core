// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_transitions_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduTransition {
  Duration get duration => throw _privateConstructorUsedError;
  Curve get curve => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduTransitionCopyWith<EduTransition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduTransitionCopyWith<$Res> {
  factory $EduTransitionCopyWith(
          EduTransition value, $Res Function(EduTransition) then) =
      _$EduTransitionCopyWithImpl<$Res, EduTransition>;
  @useResult
  $Res call({Duration duration, Curve curve});
}

/// @nodoc
class _$EduTransitionCopyWithImpl<$Res, $Val extends EduTransition>
    implements $EduTransitionCopyWith<$Res> {
  _$EduTransitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? curve = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      curve: null == curve
          ? _value.curve
          : curve // ignore: cast_nullable_to_non_nullable
              as Curve,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduTransitionCopyWith<$Res>
    implements $EduTransitionCopyWith<$Res> {
  factory _$$_EduTransitionCopyWith(
          _$_EduTransition value, $Res Function(_$_EduTransition) then) =
      __$$_EduTransitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration duration, Curve curve});
}

/// @nodoc
class __$$_EduTransitionCopyWithImpl<$Res>
    extends _$EduTransitionCopyWithImpl<$Res, _$_EduTransition>
    implements _$$_EduTransitionCopyWith<$Res> {
  __$$_EduTransitionCopyWithImpl(
      _$_EduTransition _value, $Res Function(_$_EduTransition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? curve = null,
  }) {
    return _then(_$_EduTransition(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      curve: null == curve
          ? _value.curve
          : curve // ignore: cast_nullable_to_non_nullable
              as Curve,
    ));
  }
}

/// @nodoc

class _$_EduTransition with DiagnosticableTreeMixin implements _EduTransition {
  const _$_EduTransition({required this.duration, required this.curve});

  @override
  final Duration duration;
  @override
  final Curve curve;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EduTransition(duration: $duration, curve: $curve)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EduTransition'))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('curve', curve));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduTransition &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.curve, curve) || other.curve == curve));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, curve);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduTransitionCopyWith<_$_EduTransition> get copyWith =>
      __$$_EduTransitionCopyWithImpl<_$_EduTransition>(this, _$identity);
}

abstract class _EduTransition implements EduTransition {
  const factory _EduTransition(
      {required final Duration duration,
      required final Curve curve}) = _$_EduTransition;

  @override
  Duration get duration;
  @override
  Curve get curve;
  @override
  @JsonKey(ignore: true)
  _$$_EduTransitionCopyWith<_$_EduTransition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EduTransitionsTheme {
  EduTransition get emphasized => throw _privateConstructorUsedError;
  EduTransition get emphasizedAccelerate => throw _privateConstructorUsedError;
  EduTransition get emphasizedDecelerate => throw _privateConstructorUsedError;
  EduTransition get standard => throw _privateConstructorUsedError;
  EduTransition get standardAccelerate => throw _privateConstructorUsedError;
  EduTransition get standardDecelerate => throw _privateConstructorUsedError;
  EduTransition get fast => throw _privateConstructorUsedError;
  EduTransition get fastAccelerate => throw _privateConstructorUsedError;
  EduTransition get fastDecelerate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduTransitionsThemeCopyWith<EduTransitionsTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduTransitionsThemeCopyWith<$Res> {
  factory $EduTransitionsThemeCopyWith(
          EduTransitionsTheme value, $Res Function(EduTransitionsTheme) then) =
      _$EduTransitionsThemeCopyWithImpl<$Res, EduTransitionsTheme>;
  @useResult
  $Res call(
      {EduTransition emphasized,
      EduTransition emphasizedAccelerate,
      EduTransition emphasizedDecelerate,
      EduTransition standard,
      EduTransition standardAccelerate,
      EduTransition standardDecelerate,
      EduTransition fast,
      EduTransition fastAccelerate,
      EduTransition fastDecelerate});

  $EduTransitionCopyWith<$Res> get emphasized;
  $EduTransitionCopyWith<$Res> get emphasizedAccelerate;
  $EduTransitionCopyWith<$Res> get emphasizedDecelerate;
  $EduTransitionCopyWith<$Res> get standard;
  $EduTransitionCopyWith<$Res> get standardAccelerate;
  $EduTransitionCopyWith<$Res> get standardDecelerate;
  $EduTransitionCopyWith<$Res> get fast;
  $EduTransitionCopyWith<$Res> get fastAccelerate;
  $EduTransitionCopyWith<$Res> get fastDecelerate;
}

/// @nodoc
class _$EduTransitionsThemeCopyWithImpl<$Res, $Val extends EduTransitionsTheme>
    implements $EduTransitionsThemeCopyWith<$Res> {
  _$EduTransitionsThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emphasized = null,
    Object? emphasizedAccelerate = null,
    Object? emphasizedDecelerate = null,
    Object? standard = null,
    Object? standardAccelerate = null,
    Object? standardDecelerate = null,
    Object? fast = null,
    Object? fastAccelerate = null,
    Object? fastDecelerate = null,
  }) {
    return _then(_value.copyWith(
      emphasized: null == emphasized
          ? _value.emphasized
          : emphasized // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      emphasizedAccelerate: null == emphasizedAccelerate
          ? _value.emphasizedAccelerate
          : emphasizedAccelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      emphasizedDecelerate: null == emphasizedDecelerate
          ? _value.emphasizedDecelerate
          : emphasizedDecelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      standard: null == standard
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      standardAccelerate: null == standardAccelerate
          ? _value.standardAccelerate
          : standardAccelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      standardDecelerate: null == standardDecelerate
          ? _value.standardDecelerate
          : standardDecelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      fast: null == fast
          ? _value.fast
          : fast // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      fastAccelerate: null == fastAccelerate
          ? _value.fastAccelerate
          : fastAccelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      fastDecelerate: null == fastDecelerate
          ? _value.fastDecelerate
          : fastDecelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get emphasized {
    return $EduTransitionCopyWith<$Res>(_value.emphasized, (value) {
      return _then(_value.copyWith(emphasized: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get emphasizedAccelerate {
    return $EduTransitionCopyWith<$Res>(_value.emphasizedAccelerate, (value) {
      return _then(_value.copyWith(emphasizedAccelerate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get emphasizedDecelerate {
    return $EduTransitionCopyWith<$Res>(_value.emphasizedDecelerate, (value) {
      return _then(_value.copyWith(emphasizedDecelerate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get standard {
    return $EduTransitionCopyWith<$Res>(_value.standard, (value) {
      return _then(_value.copyWith(standard: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get standardAccelerate {
    return $EduTransitionCopyWith<$Res>(_value.standardAccelerate, (value) {
      return _then(_value.copyWith(standardAccelerate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get standardDecelerate {
    return $EduTransitionCopyWith<$Res>(_value.standardDecelerate, (value) {
      return _then(_value.copyWith(standardDecelerate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get fast {
    return $EduTransitionCopyWith<$Res>(_value.fast, (value) {
      return _then(_value.copyWith(fast: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get fastAccelerate {
    return $EduTransitionCopyWith<$Res>(_value.fastAccelerate, (value) {
      return _then(_value.copyWith(fastAccelerate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EduTransitionCopyWith<$Res> get fastDecelerate {
    return $EduTransitionCopyWith<$Res>(_value.fastDecelerate, (value) {
      return _then(_value.copyWith(fastDecelerate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EduTransitionsThemeCopyWith<$Res>
    implements $EduTransitionsThemeCopyWith<$Res> {
  factory _$$_EduTransitionsThemeCopyWith(_$_EduTransitionsTheme value,
          $Res Function(_$_EduTransitionsTheme) then) =
      __$$_EduTransitionsThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EduTransition emphasized,
      EduTransition emphasizedAccelerate,
      EduTransition emphasizedDecelerate,
      EduTransition standard,
      EduTransition standardAccelerate,
      EduTransition standardDecelerate,
      EduTransition fast,
      EduTransition fastAccelerate,
      EduTransition fastDecelerate});

  @override
  $EduTransitionCopyWith<$Res> get emphasized;
  @override
  $EduTransitionCopyWith<$Res> get emphasizedAccelerate;
  @override
  $EduTransitionCopyWith<$Res> get emphasizedDecelerate;
  @override
  $EduTransitionCopyWith<$Res> get standard;
  @override
  $EduTransitionCopyWith<$Res> get standardAccelerate;
  @override
  $EduTransitionCopyWith<$Res> get standardDecelerate;
  @override
  $EduTransitionCopyWith<$Res> get fast;
  @override
  $EduTransitionCopyWith<$Res> get fastAccelerate;
  @override
  $EduTransitionCopyWith<$Res> get fastDecelerate;
}

/// @nodoc
class __$$_EduTransitionsThemeCopyWithImpl<$Res>
    extends _$EduTransitionsThemeCopyWithImpl<$Res, _$_EduTransitionsTheme>
    implements _$$_EduTransitionsThemeCopyWith<$Res> {
  __$$_EduTransitionsThemeCopyWithImpl(_$_EduTransitionsTheme _value,
      $Res Function(_$_EduTransitionsTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emphasized = null,
    Object? emphasizedAccelerate = null,
    Object? emphasizedDecelerate = null,
    Object? standard = null,
    Object? standardAccelerate = null,
    Object? standardDecelerate = null,
    Object? fast = null,
    Object? fastAccelerate = null,
    Object? fastDecelerate = null,
  }) {
    return _then(_$_EduTransitionsTheme(
      emphasized: null == emphasized
          ? _value.emphasized
          : emphasized // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      emphasizedAccelerate: null == emphasizedAccelerate
          ? _value.emphasizedAccelerate
          : emphasizedAccelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      emphasizedDecelerate: null == emphasizedDecelerate
          ? _value.emphasizedDecelerate
          : emphasizedDecelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      standard: null == standard
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      standardAccelerate: null == standardAccelerate
          ? _value.standardAccelerate
          : standardAccelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      standardDecelerate: null == standardDecelerate
          ? _value.standardDecelerate
          : standardDecelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      fast: null == fast
          ? _value.fast
          : fast // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      fastAccelerate: null == fastAccelerate
          ? _value.fastAccelerate
          : fastAccelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
      fastDecelerate: null == fastDecelerate
          ? _value.fastDecelerate
          : fastDecelerate // ignore: cast_nullable_to_non_nullable
              as EduTransition,
    ));
  }
}

/// @nodoc

class _$_EduTransitionsTheme
    with DiagnosticableTreeMixin
    implements _EduTransitionsTheme {
  const _$_EduTransitionsTheme(
      {required this.emphasized,
      required this.emphasizedAccelerate,
      required this.emphasizedDecelerate,
      required this.standard,
      required this.standardAccelerate,
      required this.standardDecelerate,
      required this.fast,
      required this.fastAccelerate,
      required this.fastDecelerate});

  @override
  final EduTransition emphasized;
  @override
  final EduTransition emphasizedAccelerate;
  @override
  final EduTransition emphasizedDecelerate;
  @override
  final EduTransition standard;
  @override
  final EduTransition standardAccelerate;
  @override
  final EduTransition standardDecelerate;
  @override
  final EduTransition fast;
  @override
  final EduTransition fastAccelerate;
  @override
  final EduTransition fastDecelerate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EduTransitionsTheme(emphasized: $emphasized, emphasizedAccelerate: $emphasizedAccelerate, emphasizedDecelerate: $emphasizedDecelerate, standard: $standard, standardAccelerate: $standardAccelerate, standardDecelerate: $standardDecelerate, fast: $fast, fastAccelerate: $fastAccelerate, fastDecelerate: $fastDecelerate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EduTransitionsTheme'))
      ..add(DiagnosticsProperty('emphasized', emphasized))
      ..add(DiagnosticsProperty('emphasizedAccelerate', emphasizedAccelerate))
      ..add(DiagnosticsProperty('emphasizedDecelerate', emphasizedDecelerate))
      ..add(DiagnosticsProperty('standard', standard))
      ..add(DiagnosticsProperty('standardAccelerate', standardAccelerate))
      ..add(DiagnosticsProperty('standardDecelerate', standardDecelerate))
      ..add(DiagnosticsProperty('fast', fast))
      ..add(DiagnosticsProperty('fastAccelerate', fastAccelerate))
      ..add(DiagnosticsProperty('fastDecelerate', fastDecelerate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduTransitionsTheme &&
            (identical(other.emphasized, emphasized) ||
                other.emphasized == emphasized) &&
            (identical(other.emphasizedAccelerate, emphasizedAccelerate) ||
                other.emphasizedAccelerate == emphasizedAccelerate) &&
            (identical(other.emphasizedDecelerate, emphasizedDecelerate) ||
                other.emphasizedDecelerate == emphasizedDecelerate) &&
            (identical(other.standard, standard) ||
                other.standard == standard) &&
            (identical(other.standardAccelerate, standardAccelerate) ||
                other.standardAccelerate == standardAccelerate) &&
            (identical(other.standardDecelerate, standardDecelerate) ||
                other.standardDecelerate == standardDecelerate) &&
            (identical(other.fast, fast) || other.fast == fast) &&
            (identical(other.fastAccelerate, fastAccelerate) ||
                other.fastAccelerate == fastAccelerate) &&
            (identical(other.fastDecelerate, fastDecelerate) ||
                other.fastDecelerate == fastDecelerate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emphasized,
      emphasizedAccelerate,
      emphasizedDecelerate,
      standard,
      standardAccelerate,
      standardDecelerate,
      fast,
      fastAccelerate,
      fastDecelerate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduTransitionsThemeCopyWith<_$_EduTransitionsTheme> get copyWith =>
      __$$_EduTransitionsThemeCopyWithImpl<_$_EduTransitionsTheme>(
          this, _$identity);
}

abstract class _EduTransitionsTheme implements EduTransitionsTheme {
  const factory _EduTransitionsTheme(
      {required final EduTransition emphasized,
      required final EduTransition emphasizedAccelerate,
      required final EduTransition emphasizedDecelerate,
      required final EduTransition standard,
      required final EduTransition standardAccelerate,
      required final EduTransition standardDecelerate,
      required final EduTransition fast,
      required final EduTransition fastAccelerate,
      required final EduTransition fastDecelerate}) = _$_EduTransitionsTheme;

  @override
  EduTransition get emphasized;
  @override
  EduTransition get emphasizedAccelerate;
  @override
  EduTransition get emphasizedDecelerate;
  @override
  EduTransition get standard;
  @override
  EduTransition get standardAccelerate;
  @override
  EduTransition get standardDecelerate;
  @override
  EduTransition get fast;
  @override
  EduTransition get fastAccelerate;
  @override
  EduTransition get fastDecelerate;
  @override
  @JsonKey(ignore: true)
  _$$_EduTransitionsThemeCopyWith<_$_EduTransitionsTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
