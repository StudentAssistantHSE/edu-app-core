import 'dart:io';

import 'package:tools/utils/utils.dart';

abstract class DependenciesValidator {
  const DependenciesValidator._();

  static Future<String?> validateDependencies() async {
    final projectDirectory = await Git.getProjectDirectory();
    if (projectDirectory == null) {
      return "Can't detect git root directory, seems like script is moved outside repository";
    }

    final errors = <String>[];
    if (Paths.directoryExists(projectDirectory)) {
      final pubspecFiles = await Paths.getAllPubspecFiles(projectDirectory, ignoreToolsProject: false);
      for (final pubspecFile in pubspecFiles) {
        final pubspecDirectory = pubspecFile.parent.path;
        stdout.writeln('Start validating dependencies for $pubspecDirectory');
        if (!Paths.fileExists('$pubspecDirectory${Platform.pathSeparator}dart_dependency_validator.yaml')) {
          stdout.writeln('No dart_dependency_validator.yaml found in $pubspecDirectory');
          errors.add(pubspecDirectory);
          continue;
        }
        final result = await Process.run(
          'flutter', ['pub', 'run', 'dependency_validator'],
          workingDirectory: pubspecDirectory,
          runInShell: true,
        );
        if (result.exitCode != 0) {
          stdout
            ..writeln('Error while validating dependencies in $pubspecDirectory')
            ..writeln(result.stderr.toString());
          errors.add(pubspecDirectory);
        } else {
          stdout.writeln('Successfully validated dependencies in $pubspecDirectory\r\n');
        }
      }
    } else {
      return 'Directory not exists';
    }
    if (errors.isEmpty) {
      return null;
    }
    final sb = StringBuffer('\r\nError while validating dependencies in:\r\n');
    for (final error in errors) {
      sb.writeln('\t$error');
    }
    return sb.toString();
  }
}