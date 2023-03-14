enum ThemeType {
  platform,
  light,
  dark,
  blue,
}

extension ThemeTypeConverter on ThemeType {
  String get asString {
    switch (this) {
      case ThemeType.platform:
        return 'platform';
      case ThemeType.light:
        return 'light';
      case ThemeType.dark:
        return 'dark';
      case ThemeType.blue:
        return 'blue';
    }
  }

  static ThemeType fromString(String string) {
    switch (string) {
      case 'platform':
        return ThemeType.platform;
      case 'light':
        return ThemeType.light;
      case 'dark':
        return ThemeType.dark;
      case 'blue':
        return ThemeType.blue;
      default:
        throw UnimplementedError('Not implemented theme type: $string');
    }
  }
}