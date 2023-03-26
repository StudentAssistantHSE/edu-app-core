import 'package:edu_ui_components/src/themes/themes.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_gradient_button.dart';
import 'package:edu_ui_components/src/widgets/dialogs/check_list_dialog_content.dart';
import 'package:edu_ui_components/src/widgets/dialogs/edu_dialog_action.dart';
import 'package:edu_ui_components/src/widgets/dialogs/information_list_dialog_content.dart';
import 'package:flutter/material.dart';

class EduDialog extends StatelessWidget {
  static const _dialogsHorizontalPadding = 32.0;
  static const _dialogsVerticalPadding = 24.0;

  final String? title;
  final Widget? content;
  final List<EduDialogAction>? actions;

  const EduDialog._({
    this.title,
    this.content,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    return AlertDialog(
      backgroundColor: theme.colorScheme.themeMain,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      title: title == null
          ? null
          : Text(
              title?.toUpperCase() ?? '',
              textAlign: TextAlign.center,
              style: theme.textTheme.title.copyWith(color: theme.colorScheme.primary500),
            ),
      content: content == null ? null : DefaultTextStyle(
        style: theme.textTheme.body.copyWith(color: theme.colorScheme.primary500),
        child: content ?? const SizedBox.shrink(),
      ),
      titlePadding: const EdgeInsets.fromLTRB(
        _dialogsHorizontalPadding,
        _dialogsVerticalPadding,
        _dialogsHorizontalPadding,
        8,
      ),
      contentPadding: EdgeInsets.fromLTRB(
        _dialogsHorizontalPadding,
        title == null ? _dialogsVerticalPadding : 0,
        _dialogsHorizontalPadding,
        24,
      ),
      actionsPadding: EdgeInsets.fromLTRB(
        _dialogsHorizontalPadding,
        content == null && title == null ? _dialogsVerticalPadding : 12,
        _dialogsHorizontalPadding,
        24,
      ),
      buttonPadding: EdgeInsets.zero,
      actions: actions
          ?.map((e) => EduGradientButton(
        text: e.text,
        onPressed: e.onPressed ?? Navigator.of(context).pop,
        expand: actions?.length == 1,
      ))
          .toList(),
    );
  }

  static Future<void> showInformationList(
    BuildContext context, {
    required List<String> items,
    required String actionTranslation,
    String? title,
    bool useRootNavigator = false,
  }) =>
      _show<void>(
        context: context,
        useRootNavigator: useRootNavigator,
        title: title,
        content: InformationListDialogContent(items: items),
        actions: [
          EduDialogAction(text: actionTranslation),
        ],
      );

  static Future<void> showCheckListDialog(
    BuildContext context, {
    required List<CheckListDialogItem> items,
    required String actionTranslation,
    String? title,
    bool useRootNavigator = false,
  }) =>
      _show(
        context: context,
        useRootNavigator: useRootNavigator,
        title: title,
        content: CheckListDialogContent(items: items),
        actions: [
          EduDialogAction(text: actionTranslation),
        ],
      );

  static Future<T?> _show<T>({
    required BuildContext context,
    bool useRootNavigator = false,
    String? title,
    Widget? content,
    List<EduDialogAction>? actions,
  }) =>
      showDialog<T>(
        context: context,
        useRootNavigator: useRootNavigator,
        barrierColor: Colors.black87,
        builder: (_) => EduDialog._(
          title: title,
          content: content,
          actions: actions,
        ),
      );
}
