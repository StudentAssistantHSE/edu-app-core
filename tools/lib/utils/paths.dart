import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as path_utils;
import 'package:tools/utils/git.dart';

abstract class Paths {
  static const pubspecFileName = 'pubspec.yaml';
  static const _toolsProjectDirectory = 'tools';
  static const _deprecatedFeaturesDirectory = 'deprecated_features';

  const Paths._();

  static bool fileExists(String path) => File(path).existsSync();
  static bool directoryExists(String path) => Directory(path).existsSync();

  static Future<String?> replaceFilesContent(File fromFile, File toFile) async {
    try {
      final fromFileContent = await fromFile.readAsString();
      await toFile.writeAsString(fromFileContent);
      return null;
    } on Exception catch (_) {
      return 'Error while replacing content from ${fromFile.path} to ${toFile.path}';
    }
  }

  static Future<String?> replaceLinesInFile(
    File file,
    bool Function(String line) linesFilter, {
    String? replaceWith,
  }) async {
    try {
      final fileLines = await file.readAsLines();
      final replacedLines = <String?>[];
      for (final line in fileLines) {
        replacedLines.add(line);
        if (linesFilter(line) && replaceWith != line) {
          replacedLines[replacedLines.length - 1] = replaceWith;
        }
      }
      replacedLines.retainWhere((element) => element != null);
      await file.writeAsString(replacedLines.join('\r\n'));
      return null;
    } on Exception catch (_) {
      return 'Error while replacing content in ${file.path}';
    }
  }

  static Future<List<File>> getAllPubspecFiles(
    String rootDirectory, {
    bool includeEndsWith = false,
    bool ignoreToolsProject = true,
    bool ignoreDeprecatedFeatures = true,
  }) =>
    getAllFiles(
      rootDirectory,
      filesFilter: (file) {
        final fileName = path_utils.basename(file.path);
        if (includeEndsWith) {
          return fileName.endsWith(pubspecFileName);
        }
        return fileName == pubspecFileName;
      },
      ignoreToolsProject: ignoreToolsProject,
      ignoreDeprecatedFeatures: ignoreDeprecatedFeatures,
    );

  static Future<List<File>> getAllFiles(
    String rootDirectory, {
    bool Function(File file)? filesFilter,
    bool ignoreToolsProject = true,
    bool ignoreDeprecatedFeatures = true,
  }) async {
    final directory = Directory(rootDirectory);
    final toolsProjectDirectory = '${await Git.getProjectDirectory()}${Platform.pathSeparator}$_toolsProjectDirectory';
    final deprecatedFeaturesDirectory = '${await Git.getProjectDirectory()}${Platform.pathSeparator}$_deprecatedFeaturesDirectory';
    final filesCompleter = Completer<List<File>>();
    final lister = directory.list(recursive: true);
    final files = <File>[];
    final subscription = lister.listen(
      (file) {
        if (ignoreToolsProject && file.path.startsWith(toolsProjectDirectory)) {
          return;
        }
        if (ignoreDeprecatedFeatures && file.path.startsWith(deprecatedFeaturesDirectory)) {
          return;
        }
        if (file is File && (filesFilter?.call(file) ?? true)) {
          files.add(file);
        }
      },
      onDone: () => filesCompleter.complete(files),
    );
    final filesCompleted = await filesCompleter.future;
    await subscription.cancel();
    return filesCompleted;
  }

  static Future<bool> hasLineInFile(File file, String pattern) async {
    try {
      final fileLines = await file.readAsLines();
      for (final line in fileLines) {
        if (line.contains(pattern)) {
          return true;
        }
      }
      return false;
    } on Exception catch (_) {
      return false;
    }
  }
}