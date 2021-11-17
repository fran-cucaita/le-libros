import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static Future<void> alert(
    BuildContext context, {
    String? title,
    String? content,
    String okText = 'Ok',
  }) {
    return showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: title != null ? Text(title) : null,
              content: content != null ? Text(content) : null,
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(_),
                  child: Text(okText),
                )
              ],
            ));
  }
}
