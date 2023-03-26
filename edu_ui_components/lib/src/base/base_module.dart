import 'dart:io';

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
  final ControllerBuilder<Controller>? moduleControllerBuilder;
  final Routing? moduleRouting;
  final BlocsBuilder<Arguments>? blocsBuilder;
  final RepositoriesBuilder<Arguments>? repositoriesBuilder;
  final List<DisposableRepositoryBuilder>? disposableRepositoriesBuilders;

  const BaseModule({
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
  final _observer = _NavigationObserver();

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
      observers: [_observer],
    );

    if (Platform.isAndroid) {
      module = WillPopScope(
        onWillPop: () async => !(await _navigation.maybePop()),
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

class _NavigationObserver extends NavigatorObserver {
  int _routesCount = 0;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routesCount++;
    if (_routesCount == 2) {
      _setWillPopCallback(true);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routesCount--;
    if (_routesCount <= 1) {
      _setWillPopCallback(false);
    }
  }

  void _setWillPopCallback(bool enabled) {
    final context = navigator?.context;
    if (context == null) {
      return;
    }
    if (enabled) {
      ModalRoute.of(context)?.addScopedWillPopCallback(_userGestureNotInProgress);
    } else {
      ModalRoute.of(context)?.removeScopedWillPopCallback(_userGestureNotInProgress);
    }
  }

  Future<bool> _userGestureNotInProgress() async => navigator?.userGestureInProgress != true;
}