import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar._internal({
    String message,
    Color backgroundColor,
  }) : super(
          content: Text(message ?? ''),
          backgroundColor: backgroundColor,
        );

  static Future<void> show(
    BuildContext context, {
    String message,
    Color backgroundColor,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(AppSnackBar._internal(
      message: message,
      backgroundColor: backgroundColor,
    ));
  }

  static Future<void> showSuccess(
    BuildContext context, {
    String message,
  }) =>
      show(context, message: message, backgroundColor: Colors.green);

  static Future<void> showError(
    BuildContext context, {
    String message,
  }) =>
      show(context, message: message, backgroundColor: Theme.of(context).errorColor);
}
