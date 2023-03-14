import 'dart:io';

import 'package:tools/generate_code/generate_code.dart';

Future<void> main(List<String> arguments) async {
  final result = await CodeGenerator.generateCode();
  if (result != null) {
    stderr.writeln(result);
    exit(-1);
  }

  stdout.writeln('Successfully run codegen');
}
