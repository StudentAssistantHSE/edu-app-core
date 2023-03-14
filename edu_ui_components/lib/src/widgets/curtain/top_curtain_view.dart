import 'package:edu_ui_components/src/widgets/curtain/bloc/curtain_bloc.dart';
import 'package:edu_ui_components/src/widgets/curtain/curtain_control_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _controlButtonSize = 80.0;
const _controlButtonPadding = 8.0;
const _maxBackgroundOpacity = 0.72;

class TopCurtainView extends StatelessWidget {
  final double collapsedHeight;
  final double controlButtonOverflow;
  final Widget? content;
  final Widget? buttonContent;
  final Widget? headerBackground;

  const TopCurtainView({
    required this.collapsedHeight,
    required this.controlButtonOverflow,
    this.content,
    this.buttonContent,
    this.headerBackground,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned.fill(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final topPadding = MediaQuery.of(context).viewPadding.top;
        final headerHeight = topPadding + collapsedHeight;
        final headerHeightWithOverflow = headerHeight + controlButtonOverflow;
        final availableHeight = constraints.maxHeight - headerHeightWithOverflow;
        return GestureDetector(
          onVerticalDragUpdate: (details) => context.read<CurtainBloc>().add(
            CurtainScrolled((details.primaryDelta ?? 0) / availableHeight),
          ),
          onVerticalDragEnd: (details) => context.read<CurtainBloc>().add(
            CurtainScrollEnded((details.primaryVelocity ?? 0) / availableHeight),
          ),
          child: BlocSelector<CurtainBloc, CurtainState, double>(
            selector: (state) => state.visibleFraction,
            builder: (context, visibleFraction) {
              final curtainHeight = availableHeight * visibleFraction + headerHeight;
              return Stack(
                fit: StackFit.expand,
                alignment: Alignment.topCenter,
                children: [
                  IgnorePointer(
                    ignoring: visibleFraction == 0,
                    child: Opacity(
                      opacity: visibleFraction * _maxBackgroundOpacity,
                      child: const ColoredBox(color: Colors.black),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    height: curtainHeight,
                    child: ClipPath(
                      clipper: _HeaderClipper(controlButtonOverflow),
                      child: Stack(
                        children: [
                          if (headerBackground != null)
                            Positioned.fill(
                              child: headerBackground ?? const SizedBox.shrink(),
                            ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            height: headerHeight + availableHeight,
                            child: SafeArea(
                              child: content ?? const SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    width: _controlButtonSize - _controlButtonPadding * 2,
                    height: _controlButtonSize - _controlButtonPadding * 2,
                    top: curtainHeight - _controlButtonSize + _controlButtonPadding + controlButtonOverflow,
                    child: CurtainControlButton(
                      visibleFraction: visibleFraction,
                      content: buttonContent,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    ),
  );
}

class _HeaderClipper extends CustomClipper<Path> {
  final double controlButtonOverflow;

  const _HeaderClipper(this.controlButtonOverflow);

  @override
  Path getClip(Size size) {
    final centerOffsetY = _controlButtonSize / 2 - controlButtonOverflow;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height - centerOffsetY), radius: _controlButtonSize / 2));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}