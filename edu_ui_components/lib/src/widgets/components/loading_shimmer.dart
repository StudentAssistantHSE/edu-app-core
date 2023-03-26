import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  final Widget child;

  const LoadingShimmer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.loadingShimmerTheme.baseColor.resolveColorScheme(theme.colorScheme),
      highlightColor: theme.loadingShimmerTheme.highlightColor.resolveColorScheme(theme.colorScheme),
      period: theme.loadingShimmerTheme.duration,
      child: child,
    );
  }
}

class KeepAliveLoadingShimmer extends StatefulWidget {
  final Widget child;
  final bool enabled;

  const KeepAliveLoadingShimmer({
    required this.child,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  _KeepAliveLoadingShimmerState createState() => _KeepAliveLoadingShimmerState();
}

class _KeepAliveLoadingShimmerState extends State<KeepAliveLoadingShimmer> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return _Proxy(child: widget.child, key: _key);
    }

    final theme = EduTheme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.loadingShimmerTheme.baseColor.resolveColorScheme(theme.colorScheme),
      highlightColor: theme.loadingShimmerTheme.highlightColor.resolveColorScheme(theme.colorScheme),
      period: theme.loadingShimmerTheme.duration,
      child: _Proxy(
        key: _key,
        child: widget.child,
      ),
    );
  }
}

class _Proxy extends StatelessWidget {
  final Widget child;

  const _Proxy({ required this.child, required Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) => child;
}