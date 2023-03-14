enum StorageKey {
  token,
  settings,
}

extension StorageKeyConverter on StorageKey {
  String get asString {
    switch (this) {
      case StorageKey.settings:
        return 'settings';
      case StorageKey.token:
        return 'token';
    }
  }
}