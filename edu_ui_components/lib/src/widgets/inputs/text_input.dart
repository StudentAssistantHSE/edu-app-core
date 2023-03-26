import 'dart:async';

import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/themes/models/referencable/referencable.dart';
import 'package:edu_ui_components/src/widgets/inputs/suffix_button.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input_validation_prefix.dart';
import 'package:flutter/material.dart';

enum TextInputSuffixType {
  empty,
  obscure,
  clear,
}

extension _TextInputSuffixTypeX on TextInputSuffixType {
  bool get isObscure => this == TextInputSuffixType.obscure;
  bool get isClear => this == TextInputSuffixType.clear;
}

class TextInput extends StatefulWidget {
  final bool enabled;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final TextInputSuffixType suffixType;
  final String? hint;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final List<TextInputFormatterInterface>? inputFormatters;
  final int? maxLength;
  final bool autofocus;
  final VoidCallback? onValidationPrefixPressed;
  final bool? isValid;
  final bool obscure;
  final bool withDelay;
  final bool errorOccurred;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;

  const TextInput({
    this.enabled = true,
    this.textInputAction,
    this.keyboardType,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.suffixType = TextInputSuffixType.empty,
    this.hint,
    this.onTap,
    this.autocorrect = true,
    this.readOnly = false,
    this.autofillHints = const [],
    this.inputFormatters,
    this.maxLength,
    this.autofocus = false,
    this.onValidationPrefixPressed,
    this.isValid,
    this.obscure = false,
    this.withDelay = false,
    this.errorOccurred = false,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.textAlignVertical,
    this.focusNode,
    Key? key,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _validationHelperKey = GlobalKey<TextInputValidationPrefixState>();
  late bool _obscure = widget.obscure;
  late bool _showSuffix;

  Timer? _delayTimer;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _focusNode;

  TextEditingController get _effectiveController => widget.controller ?? _controller;

  @override
  void didUpdateWidget(TextInput oldWidget) {
    if (widget.errorOccurred) {
      _effectiveFocusNode.requestFocus();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    if (widget.initialValue != null) {
      _effectiveController.text = widget.initialValue ?? '';
    }
    _showSuffix = _effectiveController.text.isNotEmpty && widget.suffixType.isClear
        || widget.suffixType.isObscure;
    _effectiveController.addListener(_handleControllerChanges);
    super.initState();
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_handleControllerChanges);
    _controller.dispose();
    _focusNode.dispose();
    _delayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget? suffix;
    switch (widget.suffixType) {
      case TextInputSuffixType.clear:
        suffix = SuffixButton(
          icon: const Icon(Icons.close_rounded),
          enabled: widget.enabled,
          onPressed: () {
            _delayTimer?.cancel();
            _effectiveController.clear();
            widget.onChanged?.call('');
          },
        );
        break;
      case TextInputSuffixType.obscure:
        suffix = SuffixButton(
          enabled: widget.enabled,
          icon: _obscure
              ? const Icon(CustomIcons.visibility, size: 20)
              : const Icon(CustomIcons.visibilityOff, size: 20),
          onPressed: () => setState(() => _obscure = !_obscure),
        );
        break;
      default:
        suffix = null;
        break;
    }

    final inputFormatters = widget.inputFormatters;
    final isValid = widget.isValid;
    final ComposingTextInputFormatterWithInfluenceCallback? formatter;
    if (inputFormatters == null || inputFormatters.isEmpty) {
      formatter = null;
    } else {
      formatter = ComposingTextInputFormatterWithInfluenceCallback(
        inputFormatters,
        influenceCallback: isValid == null ? null : (action) {
          switch (action) {
            case InfluenceAction.denied:
              _validationHelperKey.currentState?.handleValidationEvent(
                TextInputValidationHelperEvent.denied,
              );
              break;
            case InfluenceAction.replaced:
              _validationHelperKey.currentState?.handleValidationEvent(
                TextInputValidationHelperEvent.replaced,
              );
              break;
            default:
              break;
          }
        },
      );
    }

    final theme = EduTheme.of(context);

    final backgroundColor = theme.textInputTheme.backgroundColor
        .resolveColorScheme(theme.colorScheme);
    final focusedBackgroundColor = theme.textInputTheme.focusedBackgroundColor
        .resolveColorScheme(theme.colorScheme);
    final errorBackgroundColor = theme.textInputTheme.errorBackgroundColor
        .resolveColorScheme(theme.colorScheme);

    final foregroundColor = theme.textInputTheme.foregroundColor
        .resolveColorScheme(theme.colorScheme);
    final enteredForegroundColor = theme.textInputTheme.enteredForegroundColor
        .resolveColorScheme(theme.colorScheme);
    final errorForegroundColor = theme.textInputTheme.errorForegroundColor
        .resolveColorScheme(theme.colorScheme);
    final disabledForegroundColor = theme.textInputTheme.disabledForegroundColor
        .resolveColorScheme(theme.colorScheme);

    final hintStyle = theme.textInputTheme.hintStyle
        .resolveTextTheme(theme.textTheme).copyWith(
          color: widget.enabled
              ? (widget.errorOccurred
              ? errorForegroundColor
              : foregroundColor)
              : disabledForegroundColor,
        );
    final textStyle = theme.textInputTheme.textStyle
        .resolveTextTheme(theme.textTheme).copyWith(
          color: widget.enabled
              ? (widget.errorOccurred
              ? errorForegroundColor
              : enteredForegroundColor)
              : disabledForegroundColor,
        );

    return AnimatedBuilder(
      animation: _effectiveFocusNode,
      builder: (context, child) {
        final transition = (_effectiveFocusNode.hasFocus
            ? theme.textInputTheme.focusedTransition
            : theme.textInputTheme.unfocusedTransition)
            .resolveTransitionsTheme(theme.transitionsTheme);
        return AnimatedContainer(
          duration: transition.duration,
          curve: transition.curve,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme.textInputTheme.borderRadius),
            color: widget.errorOccurred
                ? errorBackgroundColor
                : _effectiveFocusNode.hasFocus
                ? focusedBackgroundColor
                : backgroundColor,
          ),
          child: child,
        );
      },
      child: TextField(
        focusNode: _effectiveFocusNode,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        textAlignVertical: widget.textAlignVertical,
        enabled: widget.enabled,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        inputFormatters: formatter == null ? null : [formatter],
        controller: _effectiveController,
        onChanged: (value) {
          _delayTimer?.cancel();
          if (widget.withDelay) {
            _delayTimer = Timer(theme.textInputTheme.timeoutDuration, () => widget.onChanged?.call(value));
          } else {
            widget.onChanged?.call(value);
          }
        },
        obscureText: _obscure,
        maxLength: widget.maxLength,
        style: textStyle,
        autofocus: widget.autofocus,
        cursorColor: textStyle.color,
        decoration: InputDecoration(
          contentPadding: theme.textInputTheme.padding,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.errorOccurred ? errorForegroundColor : Colors.transparent),
            borderRadius: BorderRadius.circular(theme.textInputTheme.borderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.errorOccurred ? errorForegroundColor : Colors.transparent),
            borderRadius: BorderRadius.circular(theme.textInputTheme.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.errorOccurred ? errorForegroundColor : Colors.transparent),
            borderRadius: BorderRadius.circular(theme.textInputTheme.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.errorOccurred ? errorForegroundColor : enteredForegroundColor),
            borderRadius: BorderRadius.circular(theme.textInputTheme.borderRadius),
          ),
          suffixIconColor: textStyle.color,
          prefixIconColor: textStyle.color,
          counterText: '',
          suffixIcon: _showSuffix ? suffix : null,
          prefixIcon: isValid == null
              ? null
              : TextInputValidationPrefix(
                  key: _validationHelperKey,
                  onPressed: widget.onValidationPrefixPressed,
                  isValid: isValid,
                  enabled: widget.enabled,
                ),
          hintStyle: hintStyle,
          hintText: widget.hint,
        ),
        autocorrect: widget.autocorrect,
        autofillHints: widget.enabled ? widget.autofillHints : null,
        onSubmitted: widget.onSubmitted,
        magnifierConfiguration: TextMagnifierConfiguration.disabled,
      ),
    );
  }

  void _handleControllerChanges() {
    if (_effectiveController.text.isNotEmpty && !_showSuffix && widget.suffixType.isClear) {
      setState(() => _showSuffix = true);
    } else if (_effectiveController.text.isEmpty && _showSuffix && widget.suffixType.isClear) {
      setState(() => _showSuffix = false);
    }
  }
}