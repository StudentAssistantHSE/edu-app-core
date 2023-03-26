import 'package:edu_ui_components/assets/errors_images_assets.dart';
import 'package:edu_ui_components/src/widgets/images/edu_image.dart';
import 'package:flutter/foundation.dart';

enum ErrorImageType {
  connectionError,
  undefinedError,
}

class ErrorImage extends EduImage {
  final ErrorImageType type;

  @override
  String get path {
    switch (type) {
      case ErrorImageType.connectionError:
        return ErrorsImagesAssets.connectionError;
      case ErrorImageType.undefinedError:
        return ErrorsImagesAssets.undefinedError;
    }
  }

  const ErrorImage({ required this.type, Key? key }) : super(useColor: false, key: key);
}