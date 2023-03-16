import 'dart:async';

import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/themes/edu_ui_constants.dart';
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
  final int? maxLines;
  final bool expands;
  final TextAlignVertical? textAlignVertical;

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
    this.autocorrect = true,
    this.autofillHints = const [],
    this.inputFormatters,
    this.maxLength,
    this.autofocus = false,
    this.onValidationPrefixPressed,
    this.isValid,
    this.obscure = false,
    this.withDelay = false,
    this.maxLines = 1,
    this.expands = false,
    this.textAlignVertical,
    Key? key,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final _controller = TextEditingController();
  final _validationHelperKey = GlobalKey<TextInputValidationPrefixState>();
  late bool _obscure = widget.obscure;
  late bool _showSuffix = widget.suffixType.isObscure;

  Timer? _delayTimer;

  TextEditingController get _effectiveController => widget.controller ?? _controller;

  @override
  void initState() {
    if (widget.initialValue != null) {
      _effectiveController.text = widget.initialValue ?? '';
      _showSuffix = _effectiveController.text.isNotEmpty && widget.suffixType.isClear
          || widget.suffixType.isObscure;
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
            _handleOnChanged('');
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

    final theme = Theme.of(context);

    return TextField(
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      inputFormatters: formatter == null ? null : [formatter],
      controller: _effectiveController,
      onChanged: (value) {
        _delayTimer?.cancel();
        if (widget.withDelay) {
          _delayTimer = Timer(EduUiConstants.inputTimeoutDuration, () => _handleOnChanged(value));
        } else {
          _handleOnChanged(value);
        }
      },
      obscureText: _obscure,
      maxLength: widget.maxLength,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: widget.enabled ? theme.colorScheme.primary : theme.onSurfaceSwatch.shade200,
      ),
      autofocus: widget.autofocus,
      decoration: InputDecoration(
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
        hintText: widget.hint,
      ),
      autocorrect: widget.autocorrect,
      autofillHints: widget.enabled ? widget.autofillHints : null,
      onSubmitted: widget.onSubmitted,
      maxLines: widget.maxLines,
      expands: widget.expands,
      textAlignVertical: widget.textAlignVertical,
    );
  }

  void _handleOnChanged(String value) {
    if (value.isNotEmpty && !_showSuffix && widget.suffixType.isClear) {
      setState(() => _showSuffix = true);
    } else if (value.isEmpty && _showSuffix && widget.suffixType.isClear) {
      setState(() => _showSuffix = false);
    }
    widget.onChanged?.call(value);
  }
}