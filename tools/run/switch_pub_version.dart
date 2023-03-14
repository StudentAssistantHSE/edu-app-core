import 'dart:io';

import 'package:tools/switch_pub_version/pub_version_switcher.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.length != 2) {
    stderr.writeln('Usage: "dart run switch_pub_version.dart <package name> <version>"');
    exit(-1);
  }

  final packageName = arguments.first;
  final version = arguments.last;
  final result = await PubVersionSwitcher.switchTo(packageName, version);
  if (result != null) {
    stderr.writeln(result);
    exit(-1);
  }

  stdout.writeln('$packageName version successfully switched to $version!');
}
