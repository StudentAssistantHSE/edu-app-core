import 'dart:math' as math;

import 'package:edu_core/edu_core.dart';
import 'package:flutter/material.dart';

const _maxOpacityScroll = 16.0;

abstract class StatefulWidgetWithScrollController extends StatefulWidget {
  final ScrollController? scrollController;

  const StatefulWidgetWithScrollController({ this.scrollController, Key? key }) : super(key: key);
}

mixin ScrollDividerMixin<T extends StatefulWidgetWithScrollController> on State<T> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  double _opacity = 0.0;

  double get scrollDividerOpacity => _opacity;

  @override
  void initState() {
    widget.scrollController?.addListener(_handleScrollController);
    _setOpacityWithController();
    super.initState();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    if (oldWidget.scrollController == null && widget.scrollController != null) {
      _unsubscribeScrollNotification();
      widget.scrollController?.addListener(_handleScrollController);
      _setOpacityWithController();
    } else if (oldWidget.scrollController != null && widget.scrollController == null) {
      oldWidget.scrollController?.removeListener(_handleScrollController);
      _subscribeScrollNotification();
    } else if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController?.removeListener(_handleScrollController);
      widget.scrollController?.addListener(_handleScrollController);
      _setOpacityWithController();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    if (widget.scrollController == null) {
      _subscribeScrollNotification();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_handleScrollController);
    _unsubscribeScrollNotification();
    super.dispose();
  }

  void _subscribeScrollNotification() {
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  void _unsubscribeScrollNotification() {
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = null;
  }

  double _getOpacity(double offset) =>
      (math.min(math.max(offset, 0), _maxOpacityScroll)) / _maxOpacityScroll;

  void _setOpacityWithController() {
    final controller = widget.scrollController;
    if (controller == null) {
      return;
    }
    final position = controller.positions.firstOrNull;
    if (position == null) {
      _opacity = 0.0;
      return;
    }
    switch (position.axisDirection) {
      case AxisDirection.up:
        _opacity = _getOpacity(position.extentAfter);
        break;
      case AxisDirection.down:
        _opacity = _getOpacity(position.extentBefore);
        break;
      case AxisDirection.right:
      case AxisDirection.left:
        _opacity = 0.0;
        break;
    }
  }

  void _handleScrollController() {
    final oldOpacity = _opacity;
    _setOpacityWithController();
    if (oldOpacity != _opacity) {
      setState(() {});
    }
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification && notification.depth == 0) {
      final oldOpacity = _opacity;
      final metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          _opacity = _getOpacity(metrics.extentAfter);
          break;
        case AxisDirection.down:
          _opacity = _getOpacity(metrics.extentBefore);
          break;
        case AxisDirection.right:
        case AxisDirection.left:
          _opacity = 0.0;
          break;
      }

      if (_opacity != oldOpacity) {
        setState(() { });
      }
    }
  }
}