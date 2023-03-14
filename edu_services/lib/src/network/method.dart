enum Method {
  get,
  post,
  patch,
  delete,
}

extension MethodConverter on Method {
  String get asString {
    switch (this) {
      case Method.get:
        return 'GET';
      case Method.post:
        return 'POST';
      case Method.patch:
        return 'PATCH';
      case Method.delete:
        return 'DELETE';
    }
  }
}