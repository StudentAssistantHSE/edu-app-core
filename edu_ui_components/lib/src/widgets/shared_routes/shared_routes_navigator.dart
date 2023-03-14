import 'package:edu_ui_components/src/widgets/shared_routes/bloc/shared_routes_navigator_bloc.dart';
import 'package:edu_ui_components/src/widgets/shared_routes/shared_routes_navigator_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnGenerateRoute = Route<dynamic>? Function(RouteSettings settings);

class SharedRoutesNavigator extends StatelessWidget {
  final OnGenerateRoute? onGenerateRoute;

  const SharedRoutesNavigator({
    this.onGenerateRoute,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<SharedRoutesNavigatorBloc, SharedRoutesNavigatorState>(
    buildWhen: (previous, current) => previous.index != current.index,
    builder: (context, state) => IndexedStack(
      index: state.index,
      children: [
        for (var i = 0; i < state.items.length; i++)
          SharedRoutesNavigatorItem(
            initialRoute: state.items[i].initialRoute,
            navigation: state.items[i].navigation,
            onGenerateRoute: onGenerateRoute,
            visible: i == state.index,
          ),
      ],
    ),
  );
}