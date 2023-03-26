import 'package:edu_core/edu_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisposableRepositoryBuilder<T extends DisposableRepository, Arguments> {
  final T Function(BuildContext context, Arguments? arguments) builder;

  const DisposableRepositoryBuilder({ required this.builder });

  RepositoryProvider<T> getProvider(Arguments? arguments, { void Function(T)? onCreate }) => RepositoryProvider<T>(
    create: (context) {
      final repository = builder(context, arguments);
      onCreate?.call(repository);
      return repository;
    },
  );
}