import 'dart:io';

import 'package:tools/validate_dependencies/validate_dependencies.dart';

Future<void> main(List<String> arguments) async {
  final result = await DependenciesValidator.validateDependencies();
  if (result != null) {
    stderr.writeln(result);
    exit(-1);
  }

  stdout.writeln('Successfully validated all dependencies');
}
