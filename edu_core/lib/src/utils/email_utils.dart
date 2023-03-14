import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';

abstract class EmailUtils {
  const EmailUtils._();

  static Future<bool> openEmailApp(BuildContext context, String shouldSelectAppDialogTitle) async {
    final result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen) {
      return false;
    } else if (!result.didOpen && result.canOpen) {
      if (context.mounted) {
        await showDialog<void>(
          context: context,
          builder: (_) => MailAppPickerDialog(
            mailApps: result.options,
            title: shouldSelectAppDialogTitle,
          ),
        );
      }
    }
    return true;
  }
}