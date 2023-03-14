import 'dart:io';

import 'package:tools/utils/utils.dart';

abstract class PubVersionSwitcher {
  const PubVersionSwitcher._();

  static Future<String?> switchTo(String packageName, String target) async {
    final projectDirectory = await Git.getProjectDirectory();
    if (projectDirectory == null) {
      return "Can't detect git root directory, seems like script is moved outside repository";
    }
    final pubspecFiles = await Paths.getAllPubspecFiles(
      projectDirectory,
      includeEndsWith: true,
      ignoreToolsProject: false,
    );
    for (final pubspecFile in pubspecFiles) {
      final result = await Paths.replaceLinesInFile(
        pubspecFile,
        (line) => line.startsWith('  $packageName:'),
        replaceWith: '  $packageName: $target',
      );
      if (result != null) {
        stdout.writeln(result);
      }
    }
    return null;
  }
}