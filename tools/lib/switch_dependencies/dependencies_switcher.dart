import 'dart:io';

import 'package:tools/switch_dependencies/target.dart';
import 'package:tools/utils/utils.dart';

abstract class DependenciesSwitcher {
  const DependenciesSwitcher._();

  static Future<String?> switchTo(String target) async {
    final convertedTarget = TargetConverter.fromString(target);
    if (convertedTarget == null) {
      return 'Undefined target "$target", available targets: "local", "git"';
    }

    final projectDirectory = await Git.getProjectDirectory();
    if (projectDirectory == null) {
      return "Can't detect git root directory, seems like script is moved outside repository";
    }
    final pubspecFiles = await Paths.getAllPubspecFiles(
      projectDirectory,
      ignoreToolsProject: false,
    );
    for (final pubspecFile in pubspecFiles) {
      final pubspecFileDirectory = pubspecFile.parent.path;
      final targetPubspecFile = convertedTarget.asPubspecFile;
      final targetFilePath = '$pubspecFileDirectory${Platform.pathSeparator}$targetPubspecFile';
      if (Paths.fileExists(targetFilePath)) {
        final result = await Paths.replaceFilesContent(File(targetFilePath), pubspecFile);
        if (result != null) {
          stdout.writeln(result);
        }
      } else {
        stdout.writeln("Warning: can't find $targetPubspecFile in $pubspecFileDirectory");
      }
    }
    return null;
  }
}