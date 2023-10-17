import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart' as ok_toast;

import 'operation_reply.dart';

abstract class InformationViewer {
  static showToast({
    required String msg,
    double fontSize = 16.0,
    required Color backgroundColor,
    Color? textColor,
  }) {
    ok_toast.showToast(
      msg,
      textPadding: const EdgeInsets.all(10),
      duration: const Duration(seconds: 4),
      backgroundColor: backgroundColor,
      position: ok_toast.ToastPosition.bottom,
      textStyle: TextStyle(fontSize: fontSize, color: textColor),
    );
  }

  static showErrorToast({
    required String msg,
    double fontSize = 16.0,
    Color textColor = Colors.white,
  }) {
    showToast(
      msg: msg,
      backgroundColor: Colors.red,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static showToastBasedOnReply(OperationReply reply) {
    if (reply.isSuccess()) {
      showSuccessToast(msg: reply.message);
    } else if (reply.status == OperationStatus.failed) {
      showErrorToast(msg: reply.message);
    } else {
      showToast(msg: reply.message, backgroundColor: Colors.black);
    }
  }

  static showSuccessToast({
    required String msg,
    double fontSize = 16.0,
    Color textColor = Colors.white,
  }) {
    showToast(
      msg: msg,
      backgroundColor: Colors.green,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static showSnackBar(
    String message, {
    bool popPage = false,
    int duration = 5,
    Color? bgColor,
  }) {
    BuildContext? context = Get.context;

    if (context == null) {
      return;
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: bgColor ?? Theme.of(Get.context!).scaffoldBackgroundColor.withOpacity(0.5),
        behavior: SnackBarBehavior.floating,
        closeIconColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium?.color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Icon(Icons.clear),
            ),
          ],
        ),
        duration: Duration(seconds: duration),
      ),
    );
    if (popPage) {
      Timer(
        const Duration(seconds: 5),
        () => Get.back(closeOverlays: true),
      );
    }
  }
}
