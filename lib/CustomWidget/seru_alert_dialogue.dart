import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seru_test_project/constraints/build_context.dart';

void seruAlertDialog(
    String message, {
      String? cancelText,
      String? confirmText,
      String? title,
      String? customText,
      VoidCallback? customPress,
      Color? customColor,
      Function? onConfirm,
      Function? onCancel,
      TextAlign? textAlign,
      bool isCancelable = true,
      Color? confirmColor,
    }) {
  showDialog(
    context: SeruContext.context!,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: CupertinoAlertDialog(
        title: title != null
            ? Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
            : null,
        content: Text(
          message,
          textAlign: textAlign ?? TextAlign.center,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        actions: <Widget>[
          if (isCancelable)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                if (onCancel != null) {
                  onCancel();
                } else {
                  Navigator.of(context).pop(false);
                }
              },
              child: Text(
                cancelText ?? "ok",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (customPress != null && customText != null)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: customPress,
              child: Text(
                customText,
                style: TextStyle(
                  color: customColor ?? Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (onConfirm != null)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                onConfirm();
              },
              child: Text(
                confirmText ?? "OK",
                style: TextStyle(
                  color: confirmColor ??
                      Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
