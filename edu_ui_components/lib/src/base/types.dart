import 'package:edu_ui_components/src/base/base_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ControllerBuilder<T extends BaseModuleController> = T Function(BuildContext context);
typedef UseWillPopScope<T extends BaseModuleController> = ValueListenable<bool>? Function(T? controller);
typedef RoutesTable = Map<String, Route Function(RouteSettings)>;
typedef BlocsBuilder<T> = List<BlocProvider> Function(BuildContext context, T? arguments);
typedef RepositoriesBuilder<T> = List<RepositoryProvider> Function(BuildContext context, T? arguments);