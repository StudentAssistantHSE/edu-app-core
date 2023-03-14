import 'dart:io';

import 'package:tools/utils/utils.dart';

abstract class PubGetter {
  const PubGetter._();

  static Future<String?> allPubGet({ String? rootDirectory }) async {
    final projectDirectory = await Git.getProjectDirectory();
    if (projectDirectory == null) {
      return "Can't detect git root directory, seems like script is moved outside repository";
    }

    final String targetDirectory;
    if (rootDirectory == null) {
      targetDirectory = projectDirectory;
    } else {
      targetDirectory = '$projectDirectory${Platform.pathSeparator}$rootDirectory';
    }
    final errors = <String>[];
    if (Paths.directoryExists(targetDirectory)) {
      final pubspecFiles = await Paths.getAllPubspecFiles(targetDirectory);
      for (final pubspecFile in pubspecFiles) {
        final pubspecDirectory = pubspecFile.parent.path;
        stdout.writeln('Start getting pub for $pubspecDirectory');
        final result = await Process.run(
          'flutter', ['pub', 'get'],
          workingDirectory: pubspecDirectory,
          runInShell: true,
        );
        if (result.exitCode != 0) {
          stdout
              ..writeln('Error while getting pub in $pubspecDirectory')
              ..writeln(result.stderr.toString());
          errors.add(pubspecDirectory);
        } else {
          stdout.writeln('Successfully got pub in $pubspecDirectory\r\n');
        }
      }
    } else {
      return 'Directory not exists';
    }
    if (errors.isEmpty) {
      return null;
    }
    final sb = StringBuffer('\r\nError while getting pub in:\r\n');
    for (final error in errors) {
      sb.writeln('\t$error');
    }
    return sb.toString();
  }
}