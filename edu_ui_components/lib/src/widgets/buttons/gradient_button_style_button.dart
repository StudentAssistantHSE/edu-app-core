import 'dart:math' as math;

import 'package:edu_ui_components/src/themes/edu_gradients.dart';
import 'package:edu_ui_components/src/themes/edu_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

abstract class GradientButtonStyleButton extends ButtonStyleButton {
  final MaterialColor? gradientColor;
  final List<BoxShadow>? shadow;

  const GradientButtonStyleButton({
    required super.onPressed,
    required super.onLongPress,
    required super.onHover,
    required super.onFocusChange,
    required super.style,
    required super.focusNode,
    required super.autofocus,
    required super.clipBehavior,
    required super.child,
    super.statesController,
    this.gradientColor,
    this.shadow,
    super.key,
  });

  @override
  State<GradientButtonStyleButton> createState() => _GradientButtonStyleState();

  @protected
  @override
  ButtonStyle defaultStyleOf(BuildContext context);

  @protected
  @override
  ButtonStyle? themeStyleOf(BuildContext context);
}

class _GradientButtonStyleState extends State<GradientButtonStyleButton> with TickerProviderStateMixin {
  AnimationController? controller;
  double? elevation;
  Color? backgroundColor;
  MaterialStatesController? internalStatesController;

  MaterialStatesController get statesController => widget.statesController ?? internalStatesController!;

  @override
  void initState() {
    super.initState();
    initStatesController();
  }

  @override
  void didUpdateWidget(GradientButtonStyleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.statesController != oldWidget.statesController) {
      oldWidget.statesController?.removeListener(handleStatesControllerChange);
      if (widget.statesController != null) {
        internalStatesController?.dispose();
        internalStatesController = null;
      }
      initStatesController();
    }
    if (widget.enabled != oldWidget.enabled) {
      statesController.update(MaterialState.disabled, !widget.enabled);
      if (!widget.enabled) {
        // The button may have been disabled while a press gesture is currently underway.
        statesController.update(MaterialState.pressed, false);
      }
    }
  }

  @override
  void dispose() {
    statesController.removeListener(handleStatesControllerChange);
    internalStatesController?.dispose();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgetStyle = widget.style;
    final themeStyle = widget.themeStyleOf(context);
    final defaultStyle = widget.defaultStyleOf(context);

    T? effectiveValue<T>(T? Function(ButtonStyle? style) getProperty) {
      final widgetValue  = getProperty(widgetStyle);
      final themeValue   = getProperty(themeStyle);
      final defaultValue = getProperty(defaultStyle);
      return widgetValue ?? themeValue ?? defaultValue;
    }

    T? resolve<T>(MaterialStateProperty<T>? Function(ButtonStyle? style) getProperty) {
      return effectiveValue(
        (style) {
          return getProperty(style)?.resolve(statesController.value);
        },
      );
    }

    final resolvedElevation = resolve<double?>((style) => style?.elevation);
    final resolvedTextStyle = resolve<TextStyle?>((style) => style?.textStyle);
    var resolvedBackgroundColor = resolve<Color?>((style) => style?.backgroundColor);
    final resolvedForegroundColor = resolve<Color?>((style) => style?.foregroundColor);
    final resolvedShadowColor = resolve<Color?>((style) => style?.shadowColor);
    final resolvedSurfaceTintColor = resolve<Color?>((style) => style?.surfaceTintColor);
    final resolvedPadding = resolve<EdgeInsetsGeometry?>((style) => style?.padding);
    final resolvedMinimumSize = resolve<Size?>((style) => style?.minimumSize);
    final resolvedFixedSize = resolve<Size?>((style) => style?.fixedSize);
    final resolvedMaximumSize = resolve<Size?>((style) => style?.maximumSize);
    final resolvedIconColor = resolve<Color?>((style) => style?.iconColor);
    final resolvedIconSize = resolve<double?>((style) => style?.iconSize);
    final resolvedSide = resolve<BorderSide?>((style) => style?.side);
    final resolvedShape = resolve<OutlinedBorder?>((style) => style?.shape);

    final MaterialStateMouseCursor mouseCursor = _MouseCursor(
      (states) => effectiveValue((style) => style?.mouseCursor?.resolve(states)),
    );

    final overlayColor = MaterialStateProperty.resolveWith<Color?>(
      (states) => effectiveValue((style) => style?.overlayColor?.resolve(states)),
    );

    final VisualDensity? resolvedVisualDensity = effectiveValue((style) => style?.visualDensity);
    final MaterialTapTargetSize? resolvedTapTargetSize = effectiveValue((style) => style?.tapTargetSize);
    final Duration? resolvedAnimationDuration = effectiveValue((style) => style?.animationDuration);
    final bool? resolvedEnableFeedback = effectiveValue((style) => style?.enableFeedback);
    final AlignmentGeometry? resolvedAlignment = effectiveValue((style) => style?.alignment);
    final densityAdjustment = resolvedVisualDensity!.baseSizeAdjustment;
    final InteractiveInkFeatureFactory? resolvedSplashFactory = effectiveValue((style) => style?.splashFactory);

    var effectiveConstraints = resolvedVisualDensity.effectiveConstraints(
      BoxConstraints(
        minWidth: resolvedMinimumSize!.width,
        minHeight: resolvedMinimumSize.height,
        maxWidth: resolvedMaximumSize!.width,
        maxHeight: resolvedMaximumSize.height,
      ),
    );
    if (resolvedFixedSize != null) {
      final size = effectiveConstraints.constrain(resolvedFixedSize);
      if (size.width.isFinite) {
        effectiveConstraints = effectiveConstraints.copyWith(
          minWidth: size.width,
          maxWidth: size.width,
        );
      }
      if (size.height.isFinite) {
        effectiveConstraints = effectiveConstraints.copyWith(
          minHeight: size.height,
          maxHeight: size.height,
        );
      }
    }

    final dy = densityAdjustment.dy;
    final double dx = math.max(0, densityAdjustment.dx);
    final padding = resolvedPadding!
        .add(EdgeInsets.fromLTRB(dx, dy, dx, dy))
        .clamp(EdgeInsets.zero, EdgeInsetsGeometry.infinity);

    if (resolvedAnimationDuration! > Duration.zero
        && elevation != null
        && backgroundColor != null
        && elevation != resolvedElevation
        && backgroundColor!.value != resolvedBackgroundColor!.value
        && backgroundColor!.opacity == 1
        && resolvedBackgroundColor.opacity < 1
        && resolvedElevation == 0) {
      if (controller?.duration != resolvedAnimationDuration) {
        controller?.dispose();
        controller = AnimationController(
          duration: resolvedAnimationDuration,
          vsync: this,
        )
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() { }); // Rebuild with the final background color.
            }
          });
      }
      resolvedBackgroundColor = backgroundColor; // Defer changing the background color.
      controller!.value = 0;
      controller!.forward();
    }
    elevation = resolvedElevation;
    backgroundColor = resolvedBackgroundColor;

    final gradientColor = widget.gradientColor;
    final resolvedGradientColor = gradientColor == null
        || statesController.value.contains(MaterialState.disabled)
        ? null
        : gradientColor;

    Widget result = Material(
      elevation: resolvedElevation!,
      textStyle: resolvedTextStyle?.copyWith(color: resolvedForegroundColor),
      shape: resolvedShape!.copyWith(side: resolvedSide),
      color: resolvedGradientColor == null
          ? resolvedBackgroundColor
          : Colors.transparent,
      shadowColor: resolvedShadowColor,
      surfaceTintColor: resolvedSurfaceTintColor,
      type: resolvedBackgroundColor == null ? MaterialType.transparency : MaterialType.button,
      animationDuration: resolvedAnimationDuration,
      clipBehavior: widget.clipBehavior,
      child: InkWell(
        onTap: widget.onPressed,
        onLongPress: widget.onLongPress,
        onHover: widget.onHover,
        mouseCursor: mouseCursor,
        enableFeedback: resolvedEnableFeedback,
        focusNode: widget.focusNode,
        canRequestFocus: widget.enabled,
        onFocusChange: widget.onFocusChange,
        autofocus: widget.autofocus,
        splashFactory: resolvedSplashFactory,
        overlayColor: overlayColor,
        highlightColor: Colors.transparent,
        customBorder: resolvedShape.copyWith(side: resolvedSide),
        statesController: statesController,
        child: IconTheme.merge(
          data: IconThemeData(color: resolvedIconColor ?? resolvedForegroundColor, size: resolvedIconSize),
          child: Padding(
            padding: padding,
            child: Align(
              alignment: resolvedAlignment!,
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: widget.child,
            ),
          ),
        ),
      ),
    );

    if (resolvedGradientColor != null) {
      result = DecoratedBox(
        decoration: ShapeDecoration(
          gradient: EduGradients.primaryGradient(resolvedGradientColor),
          shape: resolvedShape,
        ),
        child: result,
      );
    }

    if (widget.shadow != null) {
      final isDisabled = statesController.value.contains(MaterialState.disabled);
      final transition = isDisabled
          ? EduTransitions.standardAccelerate
          : EduTransitions.standardDecelerate;
      result = AnimatedContainer(
        duration: transition.duration,
        curve: transition.curve,
        decoration: ShapeDecoration(
          shadows: statesController.value.contains(MaterialState.disabled)
              ? const [BoxShadow(color: Colors.transparent)]
              : widget.shadow,
          shape: resolvedShape,
        ),
        child: result,
      );
    }

    result = ConstrainedBox(
      constraints: effectiveConstraints,
      child: result,
    );

    final Size minSize;
    switch (resolvedTapTargetSize!) {
      case MaterialTapTargetSize.padded:
        minSize = Size(
          kMinInteractiveDimension + densityAdjustment.dx,
          kMinInteractiveDimension + densityAdjustment.dy,
        );
        assert(minSize.width >= 0.0);
        assert(minSize.height >= 0.0);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        minSize = Size.zero;
        break;
    }

    return Semantics(
      container: true,
      button: true,
      enabled: widget.enabled,
      child: _InputPadding(
        minSize: minSize,
        child: result,
      ),
    );
  }

  void handleStatesControllerChange() {
    // Force a rebuild to resolve MaterialStateProperty properties
    setState(() { });
  }

  void initStatesController() {
    if (widget.statesController == null) {
      internalStatesController = MaterialStatesController();
    }
    statesController
      ..update(MaterialState.disabled, !widget.enabled)
      ..addListener(handleStatesControllerChange);
  }
}

class _MouseCursor extends MaterialStateMouseCursor {
  final MaterialPropertyResolver<MouseCursor?> resolveCallback;

  @override
  String get debugDescription => 'ButtonStyleButton_MouseCursor';

  const _MouseCursor(this.resolveCallback);

  @override
  MouseCursor resolve(Set<MaterialState> states) => resolveCallback(states)!;
}

class _InputPadding extends SingleChildRenderObjectWidget {
  final Size minSize;

  const _InputPadding({
    required this.minSize,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderInputPadding(minSize);
  }

  @override
  void updateRenderObject(BuildContext context, covariant _RenderInputPadding renderObject) {
    renderObject.minSize = minSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  Size get minSize => _minSize;

  set minSize(Size value) {
    if (_minSize == value) {
      return;
    }
    _minSize = value;
    markNeedsLayout();
  }

  Size _minSize;

  _RenderInputPadding(this._minSize, [RenderBox? child]) : super(child);

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null) {
      return math.max(child!.getMinIntrinsicWidth(height), minSize.width);
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null) {
      return math.max(child!.getMinIntrinsicHeight(width), minSize.height);
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null) {
      return math.max(child!.getMaxIntrinsicWidth(height), minSize.width);
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null) {
      return math.max(child!.getMaxIntrinsicHeight(width), minSize.height);
    }
    return 0.0;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _computeSize(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.dryLayoutChild,
    );
  }

  @override
  void performLayout() {
    size = _computeSize(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.layoutChild,
    );
    if (child != null) {
      (child!.parentData! as BoxParentData).offset = Alignment.center.alongOffset(size - child!.size as Offset);
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, { required Offset position }) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final center = child!.size.center(Offset.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (result, position) {
        assert(position == center);
        return child!.hitTest(result, position: center);
      },
    );
  }

  Size _computeSize({required BoxConstraints constraints, required ChildLayouter layoutChild}) {
    if (child != null) {
      final childSize = layoutChild(child!, constraints);
      final double height = math.max(childSize.width, minSize.width);
      final double width = math.max(childSize.height, minSize.height);
      return constraints.constrain(Size(height, width));
    }
    return Size.zero;
  }
}
