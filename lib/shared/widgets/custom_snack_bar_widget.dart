import 'package:flutter/material.dart';

class SnackBarUtils {
  /// Displays a custom snack bar using the provided [context].
  static void showSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // Clears existing snack bars
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }
}
