// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_text_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EduTextTheme {
  TextStyle get headline => throw _privateConstructorUsedError;
  TextStyle get pageTitle => throw _privateConstructorUsedError;
  TextStyle get title => throw _privateConstructorUsedError;
  TextStyle get body => throw _privateConstructorUsedError;
  TextStyle get caption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EduTextThemeCopyWith<EduTextTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduTextThemeCopyWith<$Res> {
  factory $EduTextThemeCopyWith(
          EduTextTheme value, $Res Function(EduTextTheme) then) =
      _$EduTextThemeCopyWithImpl<$Res, EduTextTheme>;
  @useResult
  $Res call(
      {TextStyle headline,
      TextStyle pageTitle,
      TextStyle title,
      TextStyle body,
      TextStyle caption});
}

/// @nodoc
class _$EduTextThemeCopyWithImpl<$Res, $Val extends EduTextTheme>
    implements $EduTextThemeCopyWith<$Res> {
  _$EduTextThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headline = null,
    Object? pageTitle = null,
    Object? title = null,
    Object? body = null,
    Object? caption = null,
  }) {
    return _then(_value.copyWith(
      headline: null == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      pageTitle: null == pageTitle
          ? _value.pageTitle
          : pageTitle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as TextStyle,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EduTextThemeCopyWith<$Res>
    implements $EduTextThemeCopyWith<$Res> {
  factory _$$_EduTextThemeCopyWith(
          _$_EduTextTheme value, $Res Function(_$_EduTextTheme) then) =
      __$$_EduTextThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextStyle headline,
      TextStyle pageTitle,
      TextStyle title,
      TextStyle body,
      TextStyle caption});
}

/// @nodoc
class __$$_EduTextThemeCopyWithImpl<$Res>
    extends _$EduTextThemeCopyWithImpl<$Res, _$_EduTextTheme>
    implements _$$_EduTextThemeCopyWith<$Res> {
  __$$_EduTextThemeCopyWithImpl(
      _$_EduTextTheme _value, $Res Function(_$_EduTextTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headline = null,
    Object? pageTitle = null,
    Object? title = null,
    Object? body = null,
    Object? caption = null,
  }) {
    return _then(_$_EduTextTheme(
      headline: null == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      pageTitle: null == pageTitle
          ? _value.pageTitle
          : pageTitle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as TextStyle,
    ));
  }
}

/// @nodoc

class _$_EduTextTheme implements _EduTextTheme {
  const _$_EduTextTheme(
      {required this.headline,
      required this.pageTitle,
      required this.title,
      required this.body,
      required this.caption});

  @override
  final TextStyle headline;
  @override
  final TextStyle pageTitle;
  @override
  final TextStyle title;
  @override
  final TextStyle body;
  @override
  final TextStyle caption;

  @override
  String toString() {
    return 'EduTextTheme(headline: $headline, pageTitle: $pageTitle, title: $title, body: $body, caption: $caption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EduTextTheme &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            (identical(other.pageTitle, pageTitle) ||
                other.pageTitle == pageTitle) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, headline, pageTitle, title, body, caption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EduTextThemeCopyWith<_$_EduTextTheme> get copyWith =>
      __$$_EduTextThemeCopyWithImpl<_$_EduTextTheme>(this, _$identity);
}

abstract class _EduTextTheme implements EduTextTheme {
  const factory _EduTextTheme(
      {required final TextStyle headline,
      required final TextStyle pageTitle,
      required final TextStyle title,
      required final TextStyle body,
      required final TextStyle caption}) = _$_EduTextTheme;

  @override
  TextStyle get headline;
  @override
  TextStyle get pageTitle;
  @override
  TextStyle get title;
  @override
  TextStyle get body;
  @override
  TextStyle get caption;
  @override
  @JsonKey(ignore: true)
  _$$_EduTextThemeCopyWith<_$_EduTextTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
