import 'dart:io';

import 'package:tools/utils/utils.dart';

abstract class VersionSwitcher {
  static const _refStringPattern = '      ref: ';
  static const _versionStringPattern = 'version:';

  const VersionSwitcher._();

  static Future<String?> switchTo(String target) async {
    final validateResult = _validateVersion(target);
    if (validateResult != null) {
      return validateResult;
    }

    final projectDirectory = await Git.getProjectDirectory();
    if (projectDirectory == null) {
      return "Can't detect git root directory, seems like script is moved outside repository";
    }
    final pubspecFiles = await Paths.getAllPubspecFiles(
      projectDirectory,
      includeEndsWith: true,
      ignoreToolsProject: false,
    );
    final versionTarget = target.substring(1);
    for (final pubspecFile in pubspecFiles) {
      final refsResult = await Paths.replaceLinesInFile(
        pubspecFile,
        (line) => line.startsWith(_refStringPattern),
        replaceWith: '      ref: $target',
      );
      if (refsResult != null) {
        stdout.writeln(refsResult);
      }
      final versionResult = await Paths.replaceLinesInFile(
        pubspecFile,
        (line) => line.startsWith(_versionStringPattern),
        replaceWith: 'version: $versionTarget',
      );
      if (versionResult != null) {
        stdout.writeln(versionResult);
      }
    }
    return null;
  }

  static String? _validateVersion(String target) {
    if (!target.startsWith('v')) {
      return 'Version should start from "v"';
    }
    final versionParts = target.substring(1).split('.');
    if (versionParts.length != 3) {
      return 'Version should contain three parts split with "."';
    }
    for (var i = 0; i < versionParts.length; i++) {
      final validateResult = _validateVersionPart(versionParts[i]);
      if (validateResult != null) {
        final String versionPrefix;
        if (i == 0) {
          versionPrefix = 'First';
        } else if (i == 1) {
          versionPrefix = 'Second';
        } else {
          versionPrefix = 'Third';
        }
        return '$versionPrefix $validateResult';
      }
    }
    return null;
  }

  static String? _validateVersionPart(String versionPart) {
    if (versionPart.isEmpty) {
      return 'version part is empty';
    }
    if (versionPart.length == 1 && versionPart == '0') {
      return null;
    }
    if (versionPart.startsWith('0')) {
      return "version part can't start with leading zeroes";
    }
    if (int.tryParse(versionPart) == null) {
      return 'version part should be an integer number';
    }
    return null;
  }
}