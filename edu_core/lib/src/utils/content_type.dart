enum ContentType {
  user,
  project,
}

extension ContentTypeConverter on ContentType {
  String get asString {
    switch (this) {
      case ContentType.user:
        return 'users';
      case ContentType.project:
        return 'project';
    }
  }
}