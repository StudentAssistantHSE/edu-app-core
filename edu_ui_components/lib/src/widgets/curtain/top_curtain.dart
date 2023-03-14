import 'package:edu_ui_components/src/themes/edu_transitions.dart';
import 'package:edu_ui_components/src/widgets/curtain/bloc/curtain_bloc.dart';
import 'package:edu_ui_components/src/widgets/curtain/top_curtain_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _controlButtonOverflow = 16.0;

class TopCurtain extends StatelessWidget {
  final Widget? child;
  final Widget? content;
  final Widget? buttonContent;
  final Widget? headerBackground;

  const TopCurtain({
    this.child,
    this.content,
    this.buttonContent,
    this.headerBackground,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned.fill(
        child: child ?? const SizedBox.shrink(),
        top: MediaQuery.of(context).viewPadding.top
            + (Theme.of(context).appBarTheme.toolbarHeight ?? kToolbarHeight)
            + _controlButtonOverflow,
      ),
      _ControllerHolder(
        content: content,
        buttonContent: buttonContent,
        headerBackground: headerBackground,
      ),
    ],
  );
}

class _ControllerHolder extends StatefulWidget {
  final Widget? content;
  final Widget? buttonContent;
  final Widget? headerBackground;

  const _ControllerHolder({
    this.content,
    this.buttonContent,
    this.headerBackground,
    Key? key,
  }) : super(key: key);

  @override
  _ControllerHolderState createState() => _ControllerHolderState();
}

class _ControllerHolderState extends State<_ControllerHolder> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: EduTransitions.emphasized.duration,
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = Theme.of(context).appBarTheme.toolbarHeight ?? kToolbarHeight;
    return BlocProvider<CurtainBloc>(
      create: (context) => CurtainBloc(
        controller: _controller,
      ),
      child: TopCurtainView(
        collapsedHeight: appBarHeight,
        controlButtonOverflow: _controlButtonOverflow,
        content: widget.content,
        buttonContent: widget.buttonContent,
        headerBackground: widget.headerBackground,
      ),
    );
  }
}