import 'dart:typed_data';

class UploadFile {
  final String name;
  final Uint8List bytes;

  const UploadFile(this.name, this.bytes);
}