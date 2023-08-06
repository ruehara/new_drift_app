import 'package:flutter/material.dart';
import 'package:new_app_drift/library.dart';

class ExitPopupDialog {
  ExitPopupDialog._();

  static show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.l10n.exit),
          content: Text(context.l10n.exit_msg),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(context.l10n.no),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(context.l10n.yes),
            ),
          ],
        );
      },
    );
  }
}
