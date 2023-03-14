import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/base/arguments_provider.dart';
import 'package:edu_ui_components/src/base/disposable_repository_builder.dart';
import 'package:edu_ui_components/src/base/module_controller_provider.dart';
import 'package:edu_ui_components/src/base/module_routing_provider.dart';
import 'package:edu_ui_components/src/base/navigation.dart';
import 'package:edu_ui_components/src/base/navigation_provider.dart';
import 'package:edu_ui_components/src/base/types.dart';
import 'package:edu_ui_components/src/exceptions/no_route_exception.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_module_controller.dart';
part 'base_module_routing.dart';

abstract class BaseModule<
  Arguments,
  Routing extends BaseModuleRouting<Arguments>,
  Controller extends BaseModuleController
> extends StatefulWidget {
  final UseWillPopScope<Controller>? useWillPopScope;
  final ControllerBuilder<Controller>? moduleControllerBuilder;
  final Routing? moduleRouting;
  final BlocsBuilder<Arguments>? blocsBuilder;
  final RepositoriesBuilder<Arguments>? repositoriesBuilder;
  final List<DisposableRepositoryBuilder>? disposableRepositoriesBuilders;

  const BaseModule({
    this.useWillPopScope,
    this.moduleControllerBuilder,
    this.moduleRouting,
    this.blocsBuilder,
    this.repositoriesBuilder,
    this.disposableRepositoriesBuilders,
    Key? key,
  }) : super(key: key);

  @override
  _BaseModuleState<Arguments, Routing, Controller> createState() =>
      _BaseModuleState<Arguments, Routing, Controller>();
}

class _BaseModuleState<
  Arguments,
  Routing extends BaseModuleRouting<Arguments>,
  Controller extends BaseModuleController
> extends State<BaseModule<Arguments, Routing, Controller>> {
  final _navigation = Navigation();
  final List<DisposableRepository> _disposableRepositories = [];

  Controller? _controller;

  @override
  void dispose() {
    for (final repository in _disposableRepositories) {
      repository.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller ??= widget.moduleControllerBuilder?.call(context);

    final routing = widget.moduleRouting;
    final arguments = ModalRoute.of(context)?.settings.arguments as Arguments?;

    Widget module = Navigator(
      key: _navigation.navigationKey,
      initialRoute: routing?.initialRouteBuilder.call(arguments),
      onGenerateRoute: routing?.onGenerateRoute,
      onGenerateInitialRoutes: (navigatorState, routeName) =>
      routing?.onGenerateInitialRoutes.call(arguments, routeName)
          ?? Navigator.defaultGenerateInitialRoutes(navigatorState, routeName),
    );

    final useWillPopScope = widget.useWillPopScope?.call(_controller);
    if (useWillPopScope != null) {
      module = ValueListenableBuilder<bool>(
        valueListenable: useWillPopScope,
        builder: (context, value, child) => value
          ? WillPopScope(
              onWillPop: () async => !(await _navigation.maybePop()),
              child: child ?? const SizedBox.shrink(),
            )
          : child ?? const SizedBox.shrink(),
        child: module,
      );
    }

    module = ModuleControllerProvider<Controller>(
      controller: _controller,
      child: ModuleRoutingProvider<Routing, Arguments>(
        routing: routing,
        child: module,
      ),
    );

    final blocs = widget.blocsBuilder?.call(context, arguments) ?? const [];
    if (blocs.isNotEmpty) {
      module = MultiBlocProvider(
        providers: blocs,
        child: module,
      );
    }

    final repositories = [
      ...?widget.repositoriesBuilder?.call(context, arguments),
      ...?widget.disposableRepositoriesBuilders?.map(
        (e) => e.getProvider(arguments, onCreate: _disposableRepositories.add),
      ),
    ];

    if (repositories.isNotEmpty) {
      module = MultiRepositoryProvider(
        providers: repositories,
        child: module,
      );
    }

    module = ArgumentsProvider<Arguments>(
      arguments: arguments,
      child: NavigationProvider(
        navigation: _navigation,
        child: module,
      ),
    );

    return module;
  }
}