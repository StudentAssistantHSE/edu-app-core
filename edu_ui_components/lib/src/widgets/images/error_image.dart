import 'package:edu_ui_components/assets/assets.dart';
import 'package:flutter/material.dart';

enum ErrorImageType {
  connectionError,
  undefinedError,
}

extension _ErrorImageType on ErrorImageType {
  String get path {
    switch (this) {
      case ErrorImageType.connectionError:
        return _withPrefix('connection_error.png');
      case ErrorImageType.undefinedError:
        return _withPrefix('undefined_error.png');
    }
  }

  String _withPrefix(String path) => '${Assets.imagesPath}/errors/$path';
}

class ErrorImage extends StatelessWidget {
  final ErrorImageType type;

  const ErrorImage({ required this.type, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
    type.path,
    package: Assets.packageName,
    fit: BoxFit.contain,
  );
}