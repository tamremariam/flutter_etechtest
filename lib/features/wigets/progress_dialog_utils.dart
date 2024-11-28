import 'package:flutter/material.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;
  static BuildContext? _dialogContext;

  /// Common method for showing progress dialog
  static void showProgressDialog({
    required BuildContext context,
    bool isCancellable = false,
  }) {
    if (!isProgressVisible) {
      _dialogContext = context;
      showDialog(
        barrierDismissible: isCancellable,
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        },
      );
      isProgressVisible = true;
    }
  }

  /// Common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible && _dialogContext != null) {
      Navigator.of(_dialogContext!).pop();
      _dialogContext = null;
      isProgressVisible = false;
    }
  }
}
