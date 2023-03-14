import 'package:edu_core/src/utils/content_type.dart';

abstract class ShareUtils {
  const ShareUtils._();

  static String buildShareUrl({
    required String baseUrl,
    required ContentType contentType,
    required String contentUuid,
  }) => '$baseUrl/${contentType.asString}/$contentUuid';
}