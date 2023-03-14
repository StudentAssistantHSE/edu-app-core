import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/base/arguments_provider.dart';
import 'package:edu_ui_components/src/base/disposable_repository_builder.dart';
import 'package:edu_ui_components/src/base/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePage<Arguments> extends StatefulWidget {
  final Widget view;
  final BlocsBuilder<Arguments>? blocsBuilder;
  final RepositoriesBuilder<Arguments>? repositoriesBuilder;
  final List<DisposableRepositoryBuilder>? disposableRepositoriesBuilders;

  const BasePage({
    required this.view,
    this.blocsBuilder,
    this.repositoriesBuilder,
    this.disposableRepositoriesBuilders,
    Key? key,
  }) : super(key: key);

  @override
  _BasePageState<Arguments> createState() => _BasePageState<Arguments>();
}

class _BasePageState<Arguments> extends State<BasePage<Arguments>> {
  final List<DisposableRepository> _disposableRepositories = [];

  @override
  void dispose() {
    for (final repository in _disposableRepositories) {
      repository.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var page = widget.view;
    final arguments = ModalRoute.of(context)?.settings.arguments as Arguments?;

    final blocs = widget.blocsBuilder?.call(context, arguments) ?? const [];
    if (blocs.isNotEmpty) {
      page = MultiBlocProvider(
        providers: blocs,
        child: page,
      );
    }

    final repositories = [
      ...?widget.repositoriesBuilder?.call(context, arguments),
      ...?widget.disposableRepositoriesBuilders?.map(
        (e) => e.getProvider(arguments, onCreate: _disposableRepositories.add),
      ),
    ];
    if (repositories.isNotEmpty) {
      page = MultiRepositoryProvider(
        providers: repositories,
        child: page,
      );
    }

    page = ArgumentsProvider<Arguments>(
      arguments: arguments,
      child: page,
    );

    return page;
  }
}