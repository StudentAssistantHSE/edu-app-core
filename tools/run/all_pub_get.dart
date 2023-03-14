import 'dart:io';

import 'package:tools/all_pub_get/all_pub_get.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.length > 1) {
    stderr.writeln('Usage: "dart run all_pub_get.dart <additionally, specify root directory relative to project>"');
    exit(-1);
  }
  final String? rootDirectory;
  if (arguments.length == 1) {
    rootDirectory = arguments.first;
  } else {
    rootDirectory = null;
  }
  final result = await PubGetter.allPubGet(rootDirectory: rootDirectory);
  if (result != null) {
    stderr.writeln(result);
    exit(-1);
  }

  stdout.writeln('Successfully got all pubs');
}
