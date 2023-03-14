import 'dart:io';

import 'package:tools/utils/utils.dart';

abstract class CodeGenerator {
  const CodeGenerator._();

  static Future<String?> generateCode() async {
    final projectDirectory = await Git.getProjectDirectory();
    if (projectDirectory == null) {
      return "Can't detect git root directory, seems like script is moved outside repository";
    }
    final pubspecFiles = await Paths.getAllPubspecFiles(
      projectDirectory,
      ignoreToolsProject: false,
    );

    final errors = <String>[];
    for (final pubspecFile in pubspecFiles) {
      if (!(await Paths.hasLineInFile(pubspecFile, 'build_runner:'))) {
        continue;
      }

      final pubspecDirectory = pubspecFile.parent.path;
      stdout.writeln('Start codegen in $pubspecDirectory');
      final result = await Process.run(
        'flutter', ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
        workingDirectory: pubspecDirectory,
        runInShell: true,
      );
      if (result.exitCode != 0) {
        stdout
          ..writeln('Error while running codegen in $pubspecDirectory')
          ..writeln(result.stderr.toString());
        errors.add(pubspecDirectory);
      } else {
        stdout.writeln('Successfully run codegen in $pubspecDirectory\r\n');
      }
    }
    return null;
  }
}