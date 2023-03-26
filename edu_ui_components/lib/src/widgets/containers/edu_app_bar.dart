import 'dart:io';
import 'dart:math' as math;

import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_icon_button.dart';
import 'package:edu_ui_components/src/widgets/components/scroll_divider_mixin.dart';
import 'package:edu_ui_components/src/widgets/utils/screen_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

enum EduAppBarBottomBorderType {
  show,
  showOnScroll,
  none,
}

const double _kLeadingWidth = kToolbarHeight; // So the leading button is square.
const double _kMaxTitleTextScaleFactor = 1.34; // TODO(perc): Add link to Material spec when available, https://github.com/flutter/flutter/issues/58769.

// Bottom justify the toolbarHeight child which may overflow the top.
class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  final double toolbarHeight;

  const _ToolbarContainerLayout(this.toolbarHeight);

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: toolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, toolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) =>
      toolbarHeight != oldDelegate.toolbarHeight;
}

class _PreferredAppBarSize extends Size {
  final double? toolbarHeight;
  final double? bottomHeight;

  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));
}

class EduAppBar extends StatefulWidgetWithScrollController implements PreferredSizeWidget {
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final ColorSchemeReference? backgroundColor;
  final ColorSchemeReference? foregroundColor;
  final bool primary;
  final bool centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final OpacityThemeReference toolbarOpacity;
  final OpacityThemeReference bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextThemeReference? toolbarTextStyle;
  final TextThemeReference? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final EduAppBarBottomBorderType bottomBorder;

  @override
  final Size preferredSize;

  EduAppBar({
    Key? key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
    this.primary = true,
    this.centerTitle = true,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = OpacityThemeReference.visible,
    this.bottomOpacity = OpacityThemeReference.visible,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.bottomBorder = EduAppBarBottomBorderType.showOnScroll,
  }) : preferredSize = _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height),
        super(key: key);

  @override
  _EduAppBarState createState() => _EduAppBarState();

  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    if (preferredSize is _PreferredAppBarSize && preferredSize.toolbarHeight == null) {
      return (EduTheme.of(context).appBarTheme.toolbarHeight) + (preferredSize.bottomHeight ?? 0);
    }
    return preferredSize.height;
  }
}

class _EduAppBarState extends State<EduAppBar> with ScrollDividerMixin {
  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final theme = EduTheme.of(context);
    final appBarTheme = theme.appBarTheme;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    final canPop = parentRoute?.canPop ?? false;
    final useCloseButton = parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    final toolbarHeight = widget.toolbarHeight ?? appBarTheme.toolbarHeight;
    final backgroundColor = (widget.backgroundColor ?? appBarTheme.backgroundColor)
        .resolveColorScheme(theme.colorScheme);
    final foregroundColor = (widget.foregroundColor ?? appBarTheme.foregroundColor)
        .resolveColorScheme(theme.colorScheme);

    var iconTheme = IconThemeData(
      color: foregroundColor,
      size: appBarTheme.iconSize,
    );

    var toolbarTextStyle = (widget.toolbarTextStyle ?? appBarTheme.toolbarTextStyle)
        .resolveTextTheme(theme.textTheme).copyWith(color: foregroundColor);

    var titleTextStyle = (widget.titleTextStyle ?? appBarTheme.titleTextStyle)
        .resolveTextTheme(theme.textTheme).copyWith(color: foregroundColor);

    if (widget.toolbarOpacity != OpacityThemeReference.visible) {
      final opacity = const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn).transform(
        widget.toolbarOpacity.resolveOpacityTheme(theme.opacityTheme),
      );
      if (titleTextStyle.color != null) {
        titleTextStyle = titleTextStyle.copyWith(color: titleTextStyle.color!.withOpacity(opacity));
      }
      if (toolbarTextStyle.color != null) {
        toolbarTextStyle = toolbarTextStyle.copyWith(color: toolbarTextStyle.color!.withOpacity(opacity));
      }
      iconTheme = iconTheme.copyWith(
        opacity: opacity,
      );
    }

    final mediaQueryData = MediaQuery.of(context);
    var leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (canPop || (parentRoute?.impliesAppBarDismissal ?? false)) {
        leading = useCloseButton
            ? const EduAppBarCloseButton()
            : const EduAppBarBackButton();
      }
    }
    if (leading != null) {
      leading =  ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: widget.leadingWidth ?? _kLeadingWidth),
        child: Padding(
          padding: EdgeInsets.only(
            left: ScreenGrid.getPadding(screenWidth: mediaQueryData.size.width, column: 0),
          ),
          child: leading is IconButton ? Center(child: leading) : leading,
        ),
      );
    }

    var title = widget.title;
    if (title != null) {
      final namesRoute = Platform.isAndroid || Platform.isFuchsia
          || Platform.isLinux || Platform.isWindows
          ? true
          : null;

      title = _AppBarTitleBox(child: title);
      if (!widget.excludeHeaderSemantics) {
        title = Semantics(
          namesRoute: namesRoute,
          header: true,
          child: title,
        );
      }

      title = DefaultTextStyle(
        style: titleTextStyle,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: title,
      );

      title = MediaQuery(
        data: mediaQueryData.copyWith(
          textScaleFactor: math.min(
            mediaQueryData.textScaleFactor,
            _kMaxTitleTextScaleFactor,
          ),
        ),
        child: title,
      );
    }

    Widget? actions;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.actions!,
      );
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget.centerTitle,
      middleSpacing: widget.titleSpacing ?? NavigationToolbar.kMiddleSpacing,
    );

    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: _ToolbarContainerLayout(toolbarHeight),
        child: IconTheme.merge(
          data: iconTheme,
          child: DefaultTextStyle(
            style: toolbarTextStyle,
            child: toolbar,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: toolbarHeight),
              child: appBar,
            ),
          ),
          if (widget.bottomOpacity == OpacityThemeReference.visible)
            widget.bottom!
          else
            Opacity(
              opacity: const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn).transform(
                widget.bottomOpacity.resolveOpacityTheme(theme.opacityTheme),
              ),
              child: widget.bottom,
            ),
        ],
      );
    }

    if (widget.primary) {
      appBar = SafeArea(
        bottom: false,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Semantics(
            sortKey: const OrdinalSortKey(1.0),
            explicitChildNodes: true,
            child: widget.flexibleSpace,
          ),
          Semantics(
            sortKey: const OrdinalSortKey(0.0),
            explicitChildNodes: true,
            child: Material(
              type: MaterialType.transparency,
              child: appBar,
            ),
          ),
        ],
      );
    }

    final overlayStyle = widget.systemOverlayStyle ?? _systemOverlayStyleForBrightness(
      EduThemeData.estimateBrightnessForColor(backgroundColor),
    );

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: EduTheme(
          data: theme.copyWith(
            iconButtonTheme: theme.iconButtonTheme.copyWith(
              color: widget.foregroundColor ?? appBarTheme.foregroundColor,
              iconSize: appBarTheme.iconSize,
            ),
          ),
          child: Material(
            color: backgroundColor,
            shape: widget.bottomBorder == EduAppBarBottomBorderType.none
                ? null
                : Border(bottom: BorderSide(
              color: (theme.dividerTheme.color.resolveColorScheme(theme.colorScheme))
                  .withOpacity(
                widget.bottomBorder == EduAppBarBottomBorderType.showOnScroll
                    ? scrollDividerOpacity
                    : 1.0,
              ),
              width: theme.dividerTheme.height,
            )),
            child: Semantics(
              explicitChildNodes: true,
              child: appBar,
            ),
          ),
        ),
      ),
    );
  }

  SystemUiOverlayStyle _systemOverlayStyleForBrightness(Brightness brightness) {
    final style = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return SystemUiOverlayStyle(
      statusBarColor: const Color(0x00000000),
      statusBarBrightness: style.statusBarBrightness,
      statusBarIconBrightness: style.statusBarIconBrightness,
      systemStatusBarContrastEnforced: style.systemStatusBarContrastEnforced,
    );
  }
}

class _AppBarTitleBox extends SingleChildRenderObjectWidget {
  const _AppBarTitleBox({ required Widget super.child });

  @override
  _RenderAppBarTitleBox createRenderObject(BuildContext context) {
    return _RenderAppBarTitleBox(
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderAppBarTitleBox renderObject) {
    renderObject.textDirection = Directionality.of(context);
  }
}

class _RenderAppBarTitleBox extends RenderAligningShiftedBox {
  _RenderAppBarTitleBox({
    super.textDirection,
  }) : super(alignment: Alignment.center);

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final innerConstraints = constraints.copyWith(maxHeight: double.infinity);
    final childSize = child!.getDryLayout(innerConstraints);
    return constraints.constrain(childSize);
  }

  @override
  void performLayout() {
    final innerConstraints = constraints.copyWith(maxHeight: double.infinity);
    child!.layout(innerConstraints, parentUsesSize: true);
    size = constraints.constrain(child!.size);
    alignChild();
  }
}

class EduAppBarBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  /// Creates an [IconButton] with the appropriate "back" icon for the current
  /// target platform.
  const EduAppBarBackButton({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return EduIconButton(
      icon: const Icon(CustomIcons.arrowLeft),
      onPressed: onTap ?? () async {
        final navigator = Navigator.of(context);
        final root = Navigator.maybeOf(context, rootNavigator: true);
        final result = await navigator.maybePop();
        if (!result) {
          await root?.maybePop();
        }
      },
    );
  }
}

/// A Material Design close button.
///
/// A [CloseButton] is an [IconButton] with a "close" icon. When pressed, the
/// close button calls [Navigator.maybePop] to return to the previous route.
///
/// Use a [CloseButton] instead of a [BackButton] on fullscreen dialogs or
/// pages that may solicit additional actions to close.
///
/// See also:
///
///  * [AppBar], which automatically uses a [CloseButton] in its
///    [AppBar.leading] slot when appropriate.
///  * [BackButton], which is more appropriate for middle nodes in the
///    navigation tree or where pages can be popped instantaneously with
///    no user data consequence.
///  * [IconButton], to create other Material Design icon buttons.
class EduAppBarCloseButton extends StatelessWidget {
  final VoidCallback? onTap;

  /// Creates a Material Design close button.
  const EduAppBarCloseButton({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return EduIconButton(
      icon: const Icon(Icons.close),
      onPressed: onTap ?? () async {
        final navigator = Navigator.of(context);
        final root = Navigator.maybeOf(context, rootNavigator: true);
        final result = await navigator.maybePop();
        if (!result) {
          await root?.maybePop();
        }
      },
    );
  }
}
